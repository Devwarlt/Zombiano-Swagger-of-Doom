using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class CraftingHandler : PacketHandlerBase<CraftingPacket>
    {
        //Only for testing, it will be moved to mysql
        private static Dictionary<string, int> recipes = new Dictionary<string, int>(1)
        {
            { "2711,2711,2711,0,0,0,0,0", 3080 }
        };

        protected override void HandlePacket(Client client, CraftingPacket packet)
        {
            client.Manager.Logic.AddPendingAction(time => Handle(client.Player, packet));
        }

        private void Handle(Player player, CraftingPacket packet)
        {
            int itemId;

            if (recipes.TryGetValue(packet.RecipeString, out itemId))
            {
                Item item = player.Manager.GameData.Items[(ushort)itemId];
                if (item == null)
                {
                    SendFailure(player.Client, "Could not craft: Not a valid recipe!");
                    return;
                }

                foreach (var i in packet.RecipeString.Split(','))
                {
                    if (i.IsNumber())
                    {
                        if (int.Parse(i) == 0 || int.Parse(i) == -1) continue;

                        if (player.Inventory.Contains(ushort.Parse(i)))
                        {
                            player.Inventory[(int)player.Inventory.GetFirstItemIndex(ushort.Parse(i))] = null;
                        }
                        else
                        {
                            SendFailure(player.Client, "Could not craft: You dont have the required items!");
                            return;
                        }

                    }
                    else
                    {
                        SendFailure(player.Client, "Could not craft: Not a valid recipe!");
                        return;
                    }
                }

                for (int i = 0; i < player.Inventory.Length; i++)
                {
                    if (player.Inventory[i] == null && (player.SlotTypes[i] == item.SlotType ||
                        player.SlotTypes[i] == 0 || player.SlotTypes[i] == 10))
                    {
                        player.Inventory[i] = item;
                        if (i < 4) player.SetCooldownTimer();
                        player.Client.SendPacket(new BuyResultPacket
                        {
                            Result = 7,
                            Message = String.Empty
                        });
                        break;
                    }
                }
            }
            else
                SendFailure(player.Client, "Could not craft: Not a valid recipe!");
        }

        public override PacketID ID
        {
            get { return PacketID.Crafting; }
        }
    }
}
