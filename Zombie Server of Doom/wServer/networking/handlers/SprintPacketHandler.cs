using wServer.networking.cliPackets;

namespace wServer.networking.handlers
{
    internal class SprintPacketHandler : PacketHandlerBase<SprintPacket>
    {
        protected override void HandlePacket(Client client, SprintPacket packet)
        {
            if (packet.SprintStart)
            {
                if (client.Player.HasConditionEffect(ConditionEffects.Speedy)) return;
                client.Player.ApplyConditionEffect(new ConditionEffect
                {
                    Effect = ConditionEffectIndex.Speedy,
                    Range = 0,
                    DurationMS = -1
                });
            }
            else
            {
                if (!client.Player.HasConditionEffect(ConditionEffects.Speedy)) return;
                client.Player.ApplyConditionEffect(new ConditionEffect
                {
                    Effect = ConditionEffectIndex.Speedy,
                    Range = 0,
                    DurationMS = 0
                });
            }
        }

        public override PacketID ID
        {
            get { return PacketID.Sprint; }
        }
    }
}
