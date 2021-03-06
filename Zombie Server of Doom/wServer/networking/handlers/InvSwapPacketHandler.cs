﻿using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    class InvSwapPacketHandler : PacketHandlerBase<InvSwapPacket>
    {
        public override PacketID ID { get { return PacketID.InvSwap; } }

        protected override void HandlePacket(Client client, InvSwapPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t =>
            {
                if (client.Player.Owner == null) return;
                Handle(
                    client.Player,
                    client.Player.Owner.GetEntity(packet.Obj1.ObjectId),
                    client.Player.Owner.GetEntity(packet.Obj2.ObjectId),
                    packet.Obj1.SlotId, packet.Obj2.SlotId);
            });
        }

        void Handle(Player player,
                    Entity a, Entity b,
                    int slotA, int slotB)
        {
            if (a is Player && b is Player && a.Id != b.Id)
            {
                player.Client.SendPacket(new InvResultPacket() { Result = 1 });
                return;
            }

            IContainer conA = a as IContainer;
            IContainer conB = b as IContainer;

            if (player == null || conA == null || conB == null)
            {
                player.Client.SendPacket(new InvResultPacket() { Result = 1 });
                return;
            }

            Item itemA = conA.Inventory[slotA];
            Item itemB = conB.Inventory[slotB];

            if (conA is Player) (conA as Player).SetCooldownTimer();
            if (conB is Player) (conB as Player).SetCooldownTimer();

            if (!conB.AuditItem(itemA, slotB) ||
                !conA.AuditItem(itemB, slotB))
                player.Client.SendPacket(new InvResultPacket() { Result = 1 });
            else
            {
                if (conA is Container && conB is Player)
                    FireAnalytics.TrackAction(player, AchievementGUID.LootbagPickup);
                conA.Inventory[slotA] = itemB;
                conB.Inventory[slotB] = itemA;
                a.UpdateCount++;
                b.UpdateCount++;

                player.Client.SendPacket(new InvResultPacket() { Result = 0 });
            }
        }
    }
}
