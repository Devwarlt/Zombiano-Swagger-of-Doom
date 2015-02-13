﻿using System.Collections.Generic;
using System.Xml.Linq;

namespace wServer.realm.entities
{
    public class StaticObject : Entity
    {
        //Stats
        public bool Vulnerable { get; private set; }
        public bool Static { get; private set; }
        public bool Hittestable { get; private set; }
        public int HP { get; set; }
        public bool Dying { get; private set; }

        public static int? GetHP(XElement elem)
        {
            var n = elem.Element("MaxHitPoints");
            if (n != null)
                return Utils.FromString(n.Value);
            else
                return null;
        }

        public StaticObject(RealmManager manager, ushort objType, int? life, bool stat, bool dying, bool hittestable)
            : base(manager, objType)
        {
            if (Vulnerable = life.HasValue)
                HP = life.Value;
            Dying = dying;
            Static = stat;
            Hittestable = hittestable;
        }

        protected override void ExportEntityStats()
        {
            if (!Vulnerable)
                ExportStatIfChanged(StatsType.HP, int.MaxValue);
            else
                ExportStatIfChanged(StatsType.HP, HP);
            base.ExportEntityStats();
        }

        protected bool CheckHP()
        {
            if (HP <= 0)
            {
                if (ObjectDesc != null &&
                    Owner.Map[(int)(X - 0.5), (int)(Y - 0.5)].ObjType == ObjectType)
                {
                    var tile = Owner.Map[(int)(X - 0.5), (int)(Y - 0.5)].Clone();
                    tile.ObjType = 0;
                    Owner.Map[(int)(X - 0.5), (int)(Y - 0.5)] = tile;
                }
                Owner.LeaveWorld(this);
                return false;
            }
            return true;
        }

        public override void Tick(RealmTime time)
        {
            if (Vulnerable)
            {
                if (Dying)
                {
                    HP -= time.thisTickTimes;
                    UpdateCount++;
                }
                CheckHP();
            }

            base.Tick(time);
        }
    }
}
