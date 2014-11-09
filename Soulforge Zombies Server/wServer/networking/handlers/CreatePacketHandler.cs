using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.networking.cliPackets;
using wServer.realm;
using wServer.networking.svrPackets;
using db;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    class CreatePacketHandler : PacketHandlerBase<CreatePacket>
    {
        public override PacketID ID { get { return PacketID.Create; } }

        protected override void HandlePacket(Client client, CreatePacket packet)
        {
            var db = client.Manager.Database;

            int nextCharId = 1;
            nextCharId = db.GetNextCharID(client.Account);
            var cmd = db.CreateQuery();
            cmd.CommandText = "SELECT maxCharSlot FROM accounts WHERE id=@accId;";
            cmd.Parameters.AddWithValue("@accId", client.Account.AccountId);
            int maxChar = (int)cmd.ExecuteScalar();

            cmd = db.CreateQuery();
            cmd.CommandText = "SELECT COUNT(id) FROM characters WHERE accId=@accId AND dead = FALSE;";
            cmd.Parameters.AddWithValue("@accId", client.Account.AccountId);
            int currChar = (int)(long)cmd.ExecuteScalar();

            if (currChar >= maxChar)
            {
                SendFailure(client, "Not enough character slots.");
                client.Disconnect();
                return;
            }

            client.Character = Database.CreateCharacter(client.Manager.GameData, packet.ObjectType, nextCharId);

            int[] stats = new int[]
            {
                client.Character.MaxHitPoints,
                client.Character.MaxMagicPoints,
                client.Character.Attack,
                client.Character.Defense,
                client.Character.Speed,
                client.Character.Dexterity,
                client.Character.HpRegen,
                client.Character.MpRegen,
            };

            bool ok = true;
            cmd = db.CreateQuery();
            cmd.CommandText = @"INSERT INTO characters(accId, charId, charType, level, exp, fame, items, hp, mp, stats, dead, pet)
 VALUES(@accId, @charId, @charType, 1, 0, 0, @items, 100, 100, @stats, FALSE, -1);";
            cmd.Parameters.AddWithValue("@accId", client.Account.AccountId);
            cmd.Parameters.AddWithValue("@charId", nextCharId);
            cmd.Parameters.AddWithValue("@charType", packet.ObjectType);
            cmd.Parameters.AddWithValue("@items", client.Character._Equipment);
            cmd.Parameters.AddWithValue("@stats", Utils.GetCommaSepString(stats));
            int v = cmd.ExecuteNonQuery();
            ok = v > 0;

            if (ok)
            {
                var target = client.Manager.Worlds[client.targetWorld];
                //Delay to let client load remote texture
                target.Timers.Add(new WorldTimer(500, (w, t) =>
                {
                    client.SendPacket(new CreateSuccessPacket()
                    {
                        CharacterID = client.Character.CharacterId,
                        ObjectID = target.EnterWorld(client.Player = new Player(client))
                    });
                }));
                client.Stage = ProtocalStage.Ready;
            }
            else
            {
                SendFailure(client, "Failed to create character.");
                client.Disconnect();
            }
        }
    }
}
