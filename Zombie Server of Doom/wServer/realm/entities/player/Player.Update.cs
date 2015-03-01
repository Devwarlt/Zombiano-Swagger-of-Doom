﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.networking.svrPackets;
using wServer.realm.terrain;

namespace wServer.realm.entities
{
    public partial class Player
    {
        public const int RADIUS = 15;
        private const int APPOX_AREA_OF_SIGHT = (int)(Math.PI * RADIUS * RADIUS + 1);

        private int _mapWidth, _mapHeight;

        private HashSet<Entity> _clientEntities = new HashSet<Entity>();
        private HashSet<IntPoint> _clientStatic = new HashSet<IntPoint>(new IntPointComparer());

        private IEnumerable<Entity> GetNewEntities()
        {
            foreach (var i in Owner.Players)
            {
                if (_clientEntities.Add(i.Value))
                    yield return i.Value;
            }
            foreach (var i in Owner.PlayersCollision.HitTest(X, Y, RADIUS))
            {
                if (i is Decoy)
                {
                    if (_clientEntities.Add(i))
                        yield return i;
                }
            }
            foreach (var i in Owner.EnemiesCollision.HitTest(X, Y, RADIUS))
            {
                if (i is Container)
                {
                    int[] owners = (i as Container).BagOwners;
                    if (owners.Length > 0 && Array.IndexOf(owners, AccountId) == -1) continue;
                }
                if (MathsUtils.DistSqr(i.X, i.Y, X, Y) <= RADIUS * RADIUS)
                {
                    if (_clientEntities.Add(i))
                        yield return i;
                }
            }
            if (questEntity != null && _clientEntities.Add(questEntity))
                yield return questEntity;
        }
        private IEnumerable<int> GetRemovedEntities()
        {
            foreach (var i in _clientEntities)
            {
                if (i is Player && i.Owner != null) continue;
                if (MathsUtils.DistSqr(i.X, i.Y, X, Y) > RADIUS * RADIUS &&
                    !(i is StaticObject && (i as StaticObject).Static) &&
                    i != questEntity)
                    yield return i.Id;
                else if (i.Owner == null)
                    yield return i.Id;
            }
        }
        private IEnumerable<ObjectDef> GetNewStatics(int _x, int _y)
        {
            List<ObjectDef> ret = new List<ObjectDef>();
            foreach (var i in Sight.GetSightCircle(RADIUS))
            {
                int x = i.X + _x;
                int y = i.Y + _y;
                if (x < 0 || x >= _mapWidth ||
                    y < 0 || y >= _mapHeight) continue;

                var tile = Owner.Map[x, y];

                if (tile.ObjId != 0 && tile.ObjType != 0 && _clientStatic.Add(new IntPoint(x, y)))
                {
                    ObjectDef def = tile.ToDef(x, y);
                    string cls = Manager.GameData.Xmls[tile.ObjType].Element("Class").Value;
                    if (cls == "ConnectedWall" || cls == "CaveWall" || cls == "Mountain")
                        if (def.Stats.Stats.Count(_ => _.Key == StatsType.ObjectConnection && (int)_.Value != 0) == 0)
                            tile.Name = ConnectionComputer.GetConnString((xx, yy) => Owner.Map[x + xx, y + yy].ObjType == tile.ObjType);
                    ret.Add(tile.ToDef(x, y));
                }
            }
            return ret;
        }

        private IEnumerable<IntPoint> GetRemovedStatics(int _x, int _y)
        {
            foreach (var i in _clientStatic)
            {
                var dx = i.X - _x;
                var dy = i.Y - _y;
                var tile = Owner.Map[i.X, i.Y];
                if (dx * dx + dy * dy > RADIUS * RADIUS ||
                    tile.ObjType == 0)
                {
                    int objId = Owner.Map[i.X, i.Y].ObjId;
                    if (objId != 0)
                        yield return i;
                }
            }
        }

        private Dictionary<Entity, int> lastUpdate = new Dictionary<Entity, int>();
        private void SendUpdate(RealmTime time)
        {
            if (Owner == null) return;
            _mapWidth = Owner.Map.Width;
            _mapHeight = Owner.Map.Height;
            var map = Owner.Map;
            int _x = (int)X; int _y = (int)Y;

            var sendEntities = new HashSet<Entity>(GetNewEntities());

            var list = new List<UpdatePacket.TileData>(APPOX_AREA_OF_SIGHT);
            int sent = 0;
            foreach (var i in Sight.GetSightCircle(RADIUS))
            {
                int x = i.X + _x;
                int y = i.Y + _y;
                WmapTile tile;
                if (x < 0 || x >= _mapWidth ||
                    y < 0 || y >= _mapHeight ||
                    tiles[x, y] >= (tile = map[x, y]).UpdateCount) continue;
                list.Add(new UpdatePacket.TileData()
                {
                    X = (short)x,
                    Y = (short)y,
                    Tile = (Tile)tile.TileId
                });
                tiles[x, y] = tile.UpdateCount;
                sent++;
            }
            fames.TileSent(sent);

            var dropEntities = GetRemovedEntities().Distinct().ToArray();
            _clientEntities.RemoveWhere(_ => Array.IndexOf(dropEntities, _.Id) != -1);

            foreach (var i in sendEntities)
                lastUpdate[i] = i.UpdateCount;

            var newStatics = GetNewStatics(_x, _y).ToArray();
            var removeStatics = GetRemovedStatics(_x, _y).ToArray();
            List<int> removedIds = new List<int>();
            foreach (var i in removeStatics)
            {
                removedIds.Add(Owner.Map[i.X, i.Y].ObjId);
                _clientStatic.Remove(i);
            }

            if (sendEntities.Count > 0 || list.Count > 0 || dropEntities.Length > 0 ||
                newStatics.Length > 0 || removedIds.Count > 0)
            {
                UpdatePacket packet = new UpdatePacket();
                packet.Tiles = list.ToArray();
                packet.NewObjects = sendEntities.Select(_ => _.ToDefinition()).Concat(newStatics).ToArray();
                packet.RemovedObjectIds = dropEntities.Concat(removedIds).ToArray();
                client.SendPacket(packet);
            }
            SendNewTick(time);
        }

        private int tickId = 0;
        private void SendNewTick(RealmTime time)
        {
            var sendEntities = new List<Entity>();
            foreach (var i in _clientEntities)
            {
                if (i.UpdateCount > lastUpdate[i])
                {
                    sendEntities.Add(i);
                    lastUpdate[i] = i.UpdateCount;
                }
            }
            if (questEntity != null && (!lastUpdate.ContainsKey(questEntity) || questEntity.UpdateCount > lastUpdate[questEntity]))
            {
                sendEntities.Add(questEntity);
                lastUpdate[questEntity] = questEntity.UpdateCount;
            }
            NewTickPacket p = new NewTickPacket();
            tickId++;
            p.TickId = tickId;
            p.TickTime = time.thisTickTimes;
            p.UpdateStatuses = sendEntities.Select(_ => _.ExportStats()).ToArray();
            p.DateTime = Manager.CurrentDatetime;
            client.SendPacket(p);

            SaveToCharacter();
        }
    }
}