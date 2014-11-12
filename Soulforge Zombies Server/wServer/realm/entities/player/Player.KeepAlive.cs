using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.networking.svrPackets;
using wServer.networking.cliPackets;

namespace wServer.realm.entities
{
    public partial class Player
    {
        long lastPong = -1;
        int? lastTime = null;
        long tickMapping = 0;
        Queue<long> ts = new Queue<long>();

        bool sentPing = false;
        bool KeepAlive(RealmTime time)
        {
            if (lastPong == -1) lastPong = time.tickTimes - 1500;
            if (time.tickTimes - lastPong > 1500 && !sentPing)
            {
                sentPing = true;
                ts.Enqueue(time.tickTimes);
                client.SendPacket(new PingPacket());
            }
            else if (time.tickTimes - lastPong > 3000)
            {
                //client.Disconnect();
                return false;
            }
            return true;
        }
        internal void Pong(int time)
        {
            if (lastTime != null && (time - lastTime.Value > 3000 || time - lastTime.Value < 0))
                ;//client.Disconnect();
            else
                lastTime = time;
            tickMapping = ts.Dequeue() - time;
            lastPong = time + tickMapping;
            sentPing = false;
        }

        private int _hungerTicks;
        internal void HandleHunger(RealmTime time)
        {
            if (_hungerTicks >= 60 * 20)
            {
                Hunger -= 10;

                if (Hunger < 100 && Hunger > 0)
                {
                    Client.SendPacket(new NotificationBoxPacket
                    {
                        Head = "You are hungry",
                        Text = "Eat something before\n you die!"
                    });
                    SendInfo("Warning you are hungry, you should eat something.");
                }

                if (Hunger <= 0)
                {
                    SendInfo("Warning you will die if you are not going to eat something");
                    Client.SendPacket(new DamagePacket
                    {
                        Damage = 10,
                        BulletId = 0,
                        Killed = HP - 10 <= 0,
                        ObjectId = -1,
                        TargetId = Id,
                        Effects = 0
                    });
                    if (HP - 10 <= 0)
                    {
                        Client.SendPacket(new DeathPacket
                        {
                            AccountId = AccountId,
                            CharId = client.Character.CharacterId,
                            Killer = "Hunger"
                        });
                        Death("Hunger");
                        return;
                    }
                    HP -= 10;
                }
                UpdateCount++;
                _hungerTicks = 0;
            }

            _hungerTicks++;
        }
    }
}
