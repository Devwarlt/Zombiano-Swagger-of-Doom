using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace wServer.realm.entities
{
    public class Container : StaticObject, IContainer
    {
        public Container(RealmManager manager, ushort objType, int? life, bool dying)
            : base(manager, objType, life, false, dying, false)
        {
            Inventory = new Inventory(this);
            SlotTypes = new int[12];
            BagOwners = new int[0];

            var node = manager.GameData.ObjectTypeToElement[ObjectType];
            SlotTypes = Utils.FromCommaSepString32(node.Element("SlotTypes").Value);
            XElement eq = node.Element("Equipment");
            if (eq != null)
            {
                var inv = Utils.FromCommaSepString16(eq.Value).Select(_ => _ == 0xffff ? null : manager.GameData.Items[_]).ToArray();
                Array.Resize(ref inv, 12);
                Inventory.SetItems(inv);
            }
        }

        public Container(RealmManager manager, ushort id)
            : this(manager, id, null, false) { }

        public int[] SlotTypes { get; private set; }
        public Inventory Inventory { get; private set; }
        public int[] BagOwners { get; set; }

        protected override void ExportEntityStats()
        {
            ExportStatIfChanged(StatsType.Inventory0, (Inventory[0] != null ? Inventory[0].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory1, (Inventory[1] != null ? Inventory[1].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory2, (Inventory[2] != null ? Inventory[2].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory3, (Inventory[3] != null ? Inventory[3].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory4, (Inventory[4] != null ? Inventory[4].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory5, (Inventory[5] != null ? Inventory[5].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory6, (Inventory[6] != null ? Inventory[6].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory7, (Inventory[7] != null ? Inventory[7].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory8, (Inventory[8] != null ? Inventory[8].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory9, (Inventory[9] != null ? Inventory[9].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory10, (Inventory[10] != null ? Inventory[10].ObjectType : -1));
            ExportStatIfChanged(StatsType.Inventory11, (Inventory[11] != null ? Inventory[11].ObjectType : -1));
            ExportStatIfChanged(StatsType.OwnerAccountId, BagOwners.Length == 1 ? BagOwners[0] : -1);
            base.ExportEntityStats();
        }

        public override void Tick(RealmTime time)
        {
            if (ObjectType == 0x504)    //Vault chest
                return;
            bool hasItem = false;
            foreach (var i in Inventory)
                if (i != null)
                {
                    hasItem = true;
                    break;
                }
            if (!hasItem)
                Owner.LeaveWorld(this);
            base.Tick(time);
        }

        public override bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            return false;
        }
    }
}
