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
            if (client.Player.Village == default(Village))
            {
                
            }
            else
            {
                client.SendPacket(new CreateVillageResultPacket
                {
                    Success = false,
                    ErrorMessage = "You are already in a village"
                });
            }
        }

        public override PacketID ID
        {
            get { return PacketID.CreateVillage; }
        }
    }
}
