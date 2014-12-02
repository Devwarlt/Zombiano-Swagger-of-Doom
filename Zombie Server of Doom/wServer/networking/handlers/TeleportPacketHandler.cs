using System.Collections.Generic;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    class TeleportPacketHandler : PacketHandlerBase<TeleportPacket>
    {
        public static Dictionary<string, KeyValuePair<string, int>> Teleports = new Dictionary<string, KeyValuePair<string, int>>();

        public override PacketID ID { get { return PacketID.Teleport; } }

        protected override void HandlePacket(Client client, TeleportPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, t, packet.ObjectId));
        }

        void Handle(Player player, RealmTime time, int objId)
        {
            if (player.Owner == null) return;

            Entity en;
            if ((en = player.Owner.GetEntity(objId)) != null)
            {
                KeyValuePair<string, int> data;
                if (Teleports.TryGetValue(player.Name, out data))
                {
                    if (data.Value != objId)
                    {
                        Teleports.Remove(player.Name);
                        if (en is Player)
                        {
                            (en as Player).Client.SendPacket(new TeleportRequestPacket
                            {
                                Name = player.Name,
                                ObjectId = player.Id
                            });
                            Teleports.Add((en as Player).Name, new KeyValuePair<string, int>(player.Name, player.Id));
                        }
                    }
                    else
                    {
                        (en as Player).SendInfo("You will be teleported in 8 seconds");
                        (en as Player).Owner.Timers.Add(new WorldTimer(8000, (w, t) => (en as Player).Teleport(t, player.Id)));
                        player.SendInfo("Player will be teleportet to you in 8 seconds");
                        Teleports.Remove(player.Name);
                    }
                }
                else
                {
                    if (en is Player)
                    {
                        (en as Player).Client.SendPacket(new TeleportRequestPacket
                        {
                            Name = player.Name,
                            ObjectId = player.Id
                        });
                        Teleports.Add((en as Player).Name, new KeyValuePair<string, int>(player.Name, player.Id));
                    }
                    else
                        player.SendError("This is not a player.");
                }
            }
            else
                player.SendError("Player not found.");

            //player.Teleport(time, objId);
        }
    }
}
