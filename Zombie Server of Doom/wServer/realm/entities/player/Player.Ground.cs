using System;
using wServer.realm.terrain;

namespace wServer.realm.entities
{
    public partial class Player
    {
        long l = 0;
        void HandleGround(RealmTime time)
        {
            WmapTile tile = Owner.Map[(int)X, (int)Y];
            if (tile.Region == TileRegion.LeaveTown)
            {
                Client.Reconnect(new networking.svrPackets.ReconnectPacket
                {
                    GameId = -2,
                    Host = "",
                    Key = new byte[0],
                    KeyTime = 0,
                    Name = "Nexus",
                    Port = 2050
                });
            }
            if (time.tickTimes - l > 500)
            {
                if (HasConditionEffect(ConditionEffects.Paused) ||
                    HasConditionEffect(ConditionEffects.Invincible))
                    return;

                ObjectDesc objDesc = tile.ObjType == 0 ? null : Manager.GameData.ObjectDescs[tile.ObjType];
                TileDesc tileDesc = Manager.GameData.Tiles[tile.TileId];
                if (tileDesc.Damaging && (objDesc == null || !objDesc.ProtectFromGroundDamage))
                {
                    int dmg = Random.Next(tileDesc.MinDamage, tileDesc.MaxDamage);
                    dmg = (int)statsMgr.GetDefenseDamage(dmg, true);

                    HP -= dmg;
                    UpdateCount++;
                    if (HP <= 0)
                        Death("lava");

                    l = time.tickTimes;
                }
            }
        }
    }
}
