﻿using System;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    class InvDropPacketHandler : PacketHandlerBase<InvDropPacket>
    {
        public override PacketID ID { get { return PacketID.InvDrop; } }

        protected override void HandlePacket(Client client, InvDropPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t =>
            {
                if (client.Player.Owner == null) return;
                Handle(client.Player.Owner.GetEntity(packet.Slot.ObjectId) as IContainer, packet.Slot.SlotId);
            });
        }


        static Random invRand = new Random();
        void Handle(IContainer con, int slot)
        {
            if (con == null) return;
            const ushort NORM_BAG = 0x0500;
            const ushort SOUL_BAG = 0x0503;

            if (con.Inventory[slot] == null)
            {
                //still count as dropped
                Client.SendPacket(new InvResultPacket() { Result = 0 });
                return;
            }

            Item item = con.Inventory[slot];
            con.Inventory[slot] = null;
            Client.Player.UpdateCount++;

            Container container;
            if (item.Soulbound)
            {
                container = new Container(Client.Manager, SOUL_BAG, 1000 * 60, true);
                container.BagOwners = new int[] { Client.Account.AccountId };
            }
            else
                container = new Container(Client.Manager, NORM_BAG, 1000 * 60, true);
            container.Inventory[0] = item;
            container.Move(Client.Player.X + (float)((invRand.NextDouble() * 2 - 1) * 0.5),
                           Client.Player.Y + (float)((invRand.NextDouble() * 2 - 1) * 0.5));
            container.Size = 75;
            Client.Player.Owner.EnterWorld(container);

            Client.SendPacket(new InvResultPacket() { Result = 0 });
        }
    }
}
