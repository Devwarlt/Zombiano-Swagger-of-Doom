using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;

namespace wServer.networking.handlers
{
    internal class CreateVillagePacketHandler : PacketHandlerBase<CreateVillagePacket>
    {
        protected override void HandlePacket(Client client, CreateVillagePacket packet)
        {
            client.SendPacket(new CreateVillageResultPacket
            {
                Success = false,
                ErrorMessage = "Not implemented yet"
            });
        }

        public override PacketID ID
        {
            get { return PacketID.CreateVillage; }
        }
    }
}
