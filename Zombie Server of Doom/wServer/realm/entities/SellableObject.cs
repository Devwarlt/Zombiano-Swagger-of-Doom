﻿using System.Collections.Generic;
using wServer.networking.svrPackets;
using wServer.realm.worlds;

namespace wServer.realm.entities
{
    public class SellableObject : StaticObject
    {
        const int BUY_NO_GOLD = 3;
        const int BUY_NO_FAME = 6;

        public SellableObject(RealmManager manager, ushort objType)
            : base(manager, objType, null, true, false, false)
        {
            if (objType == 0x0505)  //Vault chest
            {
                Price = 0;
                Currency = CurrencyType.Gold;
                RankReq = 0;
            }
        }

        public int Price { get; set; }
        public CurrencyType Currency { get; set; }
        public int RankReq { get; set; }

        protected override void ExportEntityStats()
        {
            ExportStatIfChanged(StatsType.SellablePrice, Price);
            ExportStatIfChanged(StatsType.SellablePriceCurrency, (int)Currency);
            ExportStatIfChanged(StatsType.SellableRankRequirement, RankReq);
            base.ExportEntityStats();
        }

        protected bool TryDeduct(Player player)
        {
            var acc = player.Client.Account;
            Manager.Database.ReadStats(acc);
            if (!player.NameChosen) return false;

            if (Currency == CurrencyType.Fame)
            {
                if (acc.Stats.Fame < Price) return false;
                player.CurrentFame = acc.Stats.Fame = Manager.Database.UpdateFame(acc, -Price);
                player.UpdateCount++;
                return true;
            }
            else
            {
                if (acc.Credits < Price) return false;
                player.Credits = acc.Credits = Manager.Database.UpdateCredit(acc, -Price);
                player.UpdateCount++;
                return true;
            }
        }

        public virtual void Buy(Player player)
        {
            if (ObjectType == 0x0505)   //Vault chest
            {
                if (TryDeduct(player))
                {
                    var chest = Manager.Database.CreateChest(player.Client.Account);
                    (Owner as Vault).AddChest(chest, this);
                    player.Client.SendPacket(new BuyResultPacket()
                    {
                        Result = 0,
                        Message = "Vault Chest Get!"
                    });
                }
                else
                    player.Client.SendPacket(new BuyResultPacket()
                    {
                        Result = BUY_NO_GOLD,
                        Message = "Not enough gold!"
                    });
            }
        }
    }
}
