using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;

namespace wServer.networking.handlers
{
    internal class SellItemHandler : PacketHandlerBase<SellItemPacket>
    {
        protected override void HandlePacket(Client client, SellItemPacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client, packet));
        }

        private void Handle(Client client, SellItemPacket packet)
        {
            if (packet.SlotId == -1)
            {
                client.SendPacket(new BuyResultPacket
                {
                    Result = BuyResultPacket.SELL_ITEM_RESULT,
                    Message = "Invalid slot"
                });
                return;
            }

            if (packet.SlotId < client.Player.Inventory.Length)
            {
                var item = client.Player.Inventory[packet.SlotId];

                if (item == null)
                {
                    client.SendPacket(new BuyResultPacket
                    {
                        Result = BuyResultPacket.SELL_ITEM_RESULT,
                        Message = "Invalid slot"
                    });
                    return;
                }

                if (item.SellInfo == null)
                {
                    client.SendPacket(new BuyResultPacket
                    {
                        Result = BuyResultPacket.SELL_ITEM_RESULT,
                        Message = "This item is not sellable"
                    });
                    return;
                }

                client.Player.Credits = client.Account.Credits = client.Manager.Database.UpdateCredit(client.Account, Utils.PriceToCopper(item.SellInfo.Price, item.SellInfo.Currency));
                client.Player.Inventory[packet.SlotId] = null;
                client.Player.UpdateCount++;

                client.SendPacket(new BuyResultPacket
                {
                    Result = BuyResultPacket.SELL_ITEM_RESULT,
                    Message = ""
                });
            }
        }

        public override PacketID ID
        {
            get { return PacketID.SellItem; }
        }
    }
}
