using System.Collections.Generic;
using wServer.networking.svrPackets;

namespace wServer.realm.entities
{
    public partial class Player
    {
        private long lastPong = -1;
        private int? lastTime = null;
        private long tickMapping = 0;
        public const int HUNGERCOOLDOWNMS = 60 * 1000;
        private int _hungertime;
        private Queue<long> ts = new Queue<long>();

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
            //else if (time.tickTimes - lastPong > 3000)
            //{
            //    //client.Disconnect();
            //    return false;
            //}
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

        internal void HandleHunger(RealmTime time)
        {
            if (HasConditionEffect(ConditionEffects.Paused) || Client.Debug) return;
            if (_hungertime <= 0)
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

                    HP -= 10;

                    BroadcastSync(new DamagePacket
                    {
                        Damage = 10,
                        BulletId = 0,
                        Killed = HP <= 0,
                        ObjectId = -1,
                        TargetId = Id,
                        Effects = 0
                    }, p => this.Dist(p) <= 25);

                    if (HP <= 0)
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
                }
                UpdateCount++;
                _hungertime = HUNGERCOOLDOWNMS;
            }
            else
            {
                _hungertime -= (time.thisTickTimes - hungercooldownremove);
            }
        }
    }
}
