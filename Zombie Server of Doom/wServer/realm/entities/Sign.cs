
namespace wServer.realm.entities
{
    public class Sign : StaticObject
    {
        public Sign(RealmManager manager, ushort objType)
            : base(manager, objType, null, true, false, false)
        {
            Name = "HI REGAL";
        }

        public override bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            return false;
        }
    }
}
