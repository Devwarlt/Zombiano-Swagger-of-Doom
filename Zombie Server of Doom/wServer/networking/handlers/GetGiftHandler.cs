using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.networking.cliPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class GetGiftHandler : PacketHandlerBase<GetGiftPacket>
    {
        protected override void HandlePacket(Client client, GetGiftPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t =>
            {
                if (client.Player.Owner == null) return;

                if (packet.Delete)
                    client.Account.Gifts.Remove(packet.ItemId);
                else
                {
                    if (client.Account.Gifts.Contains(packet.ItemId))
                    {
                        var bag = new Container(client.Manager, 0x0509);
                        bag.Inventory[0] = client.Manager.GameData.Items[packet.ItemId];
                        bag.Move(client.Player.X, client.Player.Y);
                        bag.BagOwners = new int[1] { client.Player.AccountId };
                        client.Player.Owner.EnterWorld(bag);
                        client.Account.Gifts.Remove(packet.ItemId);
                    }
                    else
                        SendFailure("Gift not found");
                }
            });
        }

        public override PacketID ID
        {
            get { return PacketID.GetGift; }
        }
    }
}
