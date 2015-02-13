using System.Collections.Generic;

namespace wServer.realm.entities
{
    public class Portal : StaticObject
    {
        public Portal(RealmManager manager, ushort objType, int? life)
            : base(manager, objType, life, false, true, false)
        {
            Usable = true;
        }

        public bool Usable { get; set; }
        public World WorldInstance { get; set; }

        protected override void ExportEntityStats()
        {
            ExportStatIfChanged(StatsType.PortalUsable, Usable ? 1 : 0);
            base.ExportEntityStats();
        }

        public override void Tick(RealmTime time)
        {
            base.Tick(time);
        }

        public override bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            return false;
        }
    }
}
