#region

using wServer.networking.cliPackets;
using wServer.realm;

#endregion

namespace wServer.networking.handlers
{
    internal class ReskinHandler : PacketHandlerBase<ReskinPacket>
    {
        public override PacketID ID
        {
            get { return PacketID.Reskin; }
        }

        protected override void HandlePacket(Client client, ReskinPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t =>
            {
                if (packet.SkinId == -1)
                    client.Player.SkinType = -1;
                else if (client.Account.OwnedSkins.Contains(packet.SkinId))
                    client.Player.SkinType = packet.SkinId;
                else
                    client.Player.SendError("You do not have this skin!");
                client.Player.UpdateCount++;
                client.Player.SaveToCharacter();
            }, PendingPriority.Emergent);
        }
    }
}