using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class LearnCraftingRecipePacketHandler : PacketHandlerBase<LearnCraftingRecipePacket>
    {
        protected override void HandlePacket(Client client, LearnCraftingRecipePacket packet)
        {
            client.Manager.Logic.AddPendingAction(t => Handle(client.Player, packet));
        }

        private void Handle(Player player, LearnCraftingRecipePacket packet)
        {
            if (packet.ItemId == -1 || packet.ItemId == 0 ||
                packet.SlotId < 4 || packet.RecipeId < 0)
            {
                SendPacket(new BuyResultPacket { Result = 8, Message = "Invalid Data!" });
                return;
            }

            if (player.Inventory[packet.SlotId] == null || player.Inventory[packet.SlotId].ObjectType != packet.ItemId)
            {
                SendPacket(new BuyResultPacket { Result = 8, Message = "Invalid SlotId!" });
                return;
            }

            XElement xml;
            if(!player.Manager.GameData.Xmls.TryGetValue((ushort)packet.ItemId, out xml))
            {
                SendPacket(new BuyResultPacket { Result = 8, Message = "Invalid Data!" });
                return;
            }
            if (xml.Element("Recipe") == null)
            {
                SendPacket(new BuyResultPacket { Result = 8, Message = "This is not a crafting\nrecipe book!" });
                return;
            }

            if (int.Parse(xml.Element("Recipe").Attribute("id").Value) != packet.RecipeId)
            {
                SendPacket(new BuyResultPacket { Result = 8, Message = "Recipe id does not\nmatch with server!" });
                return;
            }

            if(Client.Account.CraftingRecipes.Contains(packet.RecipeId))
            {
                SendPacket(new BuyResultPacket { Result = 8, Message = "You already learned\nthis recipe!" });
                return;
            }

            player.Inventory[packet.SlotId] = null;

            Client.Account.CraftingRecipes.Add(packet.RecipeId);

            var cmd = player.Manager.Database.CreateQuery();
            cmd.CommandText = "UPDATE accounts SET craftingRecipes=@newCraftingRecipes WHERE id=@accId";
            cmd.Parameters.AddWithValue("@accId", Client.Account.AccountId);
            cmd.Parameters.AddWithValue("@newCraftingRecipes", Utils.GetCommaSepString<int>(Client.Account.CraftingRecipes.ToArray()));
            cmd.ExecuteNonQuery();

            SendPacket(new BuyResultPacket { Result = 8, Message = String.Empty });
            player.SendInfo("Successfully learned the recipe for: " + xml.Element("Recipe").Value);
        }

        public override PacketID ID
        {
            get { return PacketID.LearnCraftingRecipe; }
        }
    }
}
