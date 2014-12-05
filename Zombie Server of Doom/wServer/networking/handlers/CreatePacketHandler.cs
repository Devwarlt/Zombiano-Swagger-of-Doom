using db;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
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
                SendFailure("Not enough character slots.");
                client.Disconnect();
                return;
            }

            client.Character = Database.CreateCharacter(client.Manager.GameData, packet.SkinType, nextCharId);

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
            cmd.CommandText = @"INSERT INTO characters(accId, charId, skinType, level, exp, fame, items, hp, mp, stats, dead, pet)
 VALUES(@accId, @charId, @skinType, 1, 0, 0, @items, 100, 100, @stats, FALSE, -1);";
            cmd.Parameters.AddWithValue("@accId", client.Account.AccountId);
            cmd.Parameters.AddWithValue("@charId", nextCharId);
            cmd.Parameters.AddWithValue("@skinType", packet.SkinType);
            cmd.Parameters.AddWithValue("@items", client.Character._Equipment);
            cmd.Parameters.AddWithValue("@stats", Utils.GetCommaSepString(stats));
            int v = cmd.ExecuteNonQuery();
            ok = v > 0;

            if (ok)
            {
                var target = client.Manager.Worlds[client.targetWorld];
                client.SendPacket(new CreateSuccessPacket
                {
                    CharacterID = client.Character.CharacterId,
                    ObjectID = target.EnterWorld(client.Player = new Player(client))
                });
                client.Stage = ProtocalStage.Ready;
            }
            else
            {
                SendFailure("Failed to create character.");
                client.Disconnect();
            }
        }
    }
}
