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
    class ChooseNamePacketHandler : PacketHandlerBase<ChooseNamePacket>
    {
        public override PacketID ID { get { return PacketID.ChooseName; } }

        protected override void HandlePacket(Client client, ChooseNamePacket packet)
        {
            if (string.IsNullOrEmpty(packet.Name) ||
                packet.Name.Length > 10)
            {
                client.SendPacket(new NameResultPacket()
                {
                    Success = false,
                    Message = "Invalid name"
                });
            }

            var db = client.Manager.Database;
            var cmd = db.CreateQuery();
            cmd.CommandText = "SELECT COUNT(name) FROM accounts WHERE name=@name;";
            cmd.Parameters.AddWithValue("@name", packet.Name);
            if ((int)(long)cmd.ExecuteScalar() > 0)
                client.SendPacket(new NameResultPacket()
                {
                    Success = false,
                    Message = "Duplicated name"
                });
            else
            {
                db.ReadStats(client.Account);
                if (client.Account.NameChosen && client.Account.Credits < 1000)
                    client.SendPacket(new NameResultPacket()
                    {
                        Success = false,
                        Message = "Not enough credits"
                    });
                else
                {
                    cmd = db.CreateQuery();
                    cmd.CommandText = "UPDATE accounts SET name=@name, namechosen=TRUE WHERE id=@accId;";
                    cmd.Parameters.AddWithValue("@accId", client.Account.AccountId);
                    cmd.Parameters.AddWithValue("@name", packet.Name);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        client.Account.Credits = db.UpdateCredit(client.Account, -1000);
                        client.Account.Name = packet.Name;
                        client.Manager.Logic.AddPendingAction(t => Handle(client.Player));
                        client.SendPacket(new NameResultPacket()
                        {
                            Success = true,
                            Message = ""
                        });
                    }
                    else
                        client.SendPacket(new NameResultPacket()
                        {
                            Success = false,
                            Message = "Internal Error"
                        });
                }
            }
        }

        void Handle(Player player)
        {
            player.Credits = player.Client.Account.Credits;
            player.Name = player.Client.Account.Name;
            player.NameChosen = true;
            player.UpdateCount++;
        }
    }
}
