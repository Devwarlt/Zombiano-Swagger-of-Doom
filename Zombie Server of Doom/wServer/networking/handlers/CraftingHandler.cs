using System;
using System.Collections.Generic;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking.handlers
{
    internal class CraftingHandler : PacketHandlerBase<CraftingPacket>
    {
        protected override void HandlePacket(Client client, CraftingPacket packet)
        {
            client.Manager.Logic.AddPendingAction(time => Handle(client.Player, packet));
        }

        private void Handle(Player player, CraftingPacket packet)
        {
            Dictionary<string, int> recipes = new Dictionary<string, int>();

            var cmd = player.Manager.Database.CreateQuery();
            cmd.CommandText = "Select * FROM craftingrecipes";
            using (var rdr = cmd.ExecuteReader())
                while (rdr.Read())
                    if (player.Client.Account.CraftingRecipes.Contains(rdr.GetInt32("id")))
                        recipes.Add(Utils.GetCommaSepString(Utils.FromCommaSepString32(rdr.GetString("row1"))).Replace(" ", String.Empty) + "," +
                            Utils.GetCommaSepString(Utils.FromCommaSepString32(rdr.GetString("row2"))).Replace(" ", String.Empty) + "," +
                            Utils.GetCommaSepString(Utils.FromCommaSepString32(rdr.GetString("row3"))).Replace(" ", String.Empty), rdr.GetInt32("result"));

            int itemId;

            if (recipes.TryGetValue(packet.RecipeString, out itemId))
            {
                Item item = player.Manager.GameData.Items[(ushort)itemId];
                if (item == null)
                {
                    SendFailure("Could not craft: Not a valid recipe!");
                    return;
                }
                int index = 0;
                foreach (var i in packet.RecipeString.Split(','))
                {
                    if (i.IsNumber())
                    {
                        if (int.Parse(i) == 0 || int.Parse(i) == -1) continue;

                        if (player.Inventory[packet.Slots[index]] == null && player.Inventory[packet.Slots[index]].ObjectType != ushort.Parse(i))
                        {
                            SendFailure("Could not craft: You dont have the required items!");
                            return;
                        }

                        index++;
                    }
                    else
                    {
                        SendFailure("Could not craft: Not a valid recipe!");
                        return;
                    }
                }

                foreach (var i in packet.Slots)
                    player.Inventory[i] = null;

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
                SendFailure("Could not craft: Not a valid recipe!");
            player.UpdateCount++;
        }

        public override PacketID ID
        {
            get { return PacketID.Crafting; }
        }
    }
}
