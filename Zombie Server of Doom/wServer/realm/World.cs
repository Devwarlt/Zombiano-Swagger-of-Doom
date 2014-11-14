﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using wServer.realm.entities;
using System.Collections.Concurrent;
using wServer.networking;
using wServer.realm.terrain;
using log4net;

namespace wServer.realm
{
    public abstract class World
    {
        static ILog log = LogManager.GetLogger(typeof(World));

        public const int TUT_ID = -1;
        public const int NEXUS_ID = -2;
        public const int RAND_REALM = -3;
        public const int NEXUS_LIMBO = -4;
        public const int VAULT_ID = -5;
        public const int TEST_ID = -6;
        public const int GAUNTLET = -7;

        protected World()
        {
            Players = new ConcurrentDictionary<int, Player>();
            Enemies = new ConcurrentDictionary<int, Enemy>();
            Quests = new ConcurrentDictionary<int, Enemy>();
            Projectiles = new ConcurrentDictionary<Tuple<int, byte>, Projectile>();
            StaticObjects = new ConcurrentDictionary<int, StaticObject>();
            Timers = new List<WorldTimer>();
            ExtraXML = Empty<string>.Array;
            Music = Empty<string>.Array;
            AllowTeleport = true;
            ShowDisplays = true;
        }

        public bool IsLimbo { get; protected set; }
        public string[] Music { get; protected set; }
        public virtual World GetInstance(Client client) { return null; }

        RealmManager manager;
        public RealmManager Manager
        {
            get { return manager; }
            internal set
            {
                manager = value;
                if (manager != null)
                    Init();
            }
        }
        public int Id { get; internal set; }
        public string Name { get; protected set; }

        public ConcurrentDictionary<int, Player> Players { get; private set; }
        public ConcurrentDictionary<int, Enemy> Enemies { get; private set; }
        public ConcurrentDictionary<Tuple<int, byte>, Projectile> Projectiles { get; private set; }
        public ConcurrentDictionary<int, StaticObject> StaticObjects { get; private set; }
        public List<WorldTimer> Timers { get; private set; }
        public int Background { get; protected set; }

        public CollisionMap<Entity> EnemiesCollision { get; private set; }
        public CollisionMap<Entity> PlayersCollision { get; private set; }
        public bool IsPassable(int x, int y)
        {
            var tile = Map[x, y];
            ObjectDesc desc;
            if (Manager.GameData.Tiles[tile.TileId].NoWalk)
                return false;
            if (Manager.GameData.ObjectDescs.TryGetValue(tile.ObjType, out desc))
            {
                if (!desc.Static)
                    return false;
            }
            return true;
        }

        public bool AllowTeleport { get; protected set; }
        public bool ShowDisplays { get; protected set; }
        public string[] ExtraXML { get; protected set; }

        public Wmap Map { get; private set; }

        private int entityInc = 0;
        public int GetNextEntityId()
        {
            return Interlocked.Increment(ref entityInc);
        }

        public bool Delete()
        {
            lock (this)
            {
                if (Players.Count > 0) return false;
                Id = 0;
            }
            Map = null;
            Players = null;
            Enemies = null;
            Projectiles = null;
            StaticObjects = null;
            return true;
        }

        protected virtual void Init() { }

        protected void FromWorldMap(System.IO.Stream dat)
        {
            log.InfoFormat("Loading map for world {0}({1})...", Id, Name);

            this.Map = new Wmap(Manager.GameData);
            entityInc = 0;
            entityInc += Map.Load(dat, 0);

            int w = Map.Width, h = Map.Height;
            EnemiesCollision = new CollisionMap<Entity>(0, w, h);
            PlayersCollision = new CollisionMap<Entity>(1, w, h);

            Projectiles.Clear();
            StaticObjects.Clear();
            Enemies.Clear();
            Players.Clear();
            foreach (var i in Map.InstantiateEntities(Manager))
            {
                EnterWorld(i);
            }
        }

        public virtual int EnterWorld(Entity entity)
        {
            if (entity is Player)
            {
                entity.Id = GetNextEntityId();
                entity.Init(this);
                Players.TryAdd(entity.Id, entity as Player);
                PlayersCollision.Insert(entity);
            }
            else if (entity is Enemy)
            {
                entity.Id = GetNextEntityId();
                entity.Init(this);
                Enemies.TryAdd(entity.Id, entity as Enemy);
                EnemiesCollision.Insert(entity);
                if (entity.ObjectDesc.Quest)
                    Quests.TryAdd(entity.Id, entity as Enemy);
            }
            else if (entity is Projectile)
            {
                entity.Init(this);
                Projectile prj = entity as Projectile;
                Projectiles[new Tuple<int, byte>(prj.ProjectileOwner.Self.Id, prj.ProjectileId)] = prj;
            }
            else if (entity is StaticObject)
            {
                entity.Id = GetNextEntityId();
                entity.Init(this);
                StaticObjects.TryAdd(entity.Id, entity as StaticObject);
                if (entity is Decoy)
                    PlayersCollision.Insert(entity);
                else
                    EnemiesCollision.Insert(entity);
            }
            return entity.Id;
        }
        public virtual void LeaveWorld(Entity entity)
        {
            if (entity is Player)
            {
                Player dummy;
                Players.TryRemove(entity.Id, out dummy);
                PlayersCollision.Remove(entity);
            }
            else if (entity is Enemy)
            {
                Enemy dummy;
                Enemies.TryRemove(entity.Id, out dummy);
                EnemiesCollision.Remove(entity);
                if (entity.ObjectDesc.Quest)
                    Quests.TryRemove(entity.Id, out dummy);
            }
            else if (entity is Projectile)
            {
                Projectile p = entity as Projectile;
                Projectiles.TryRemove(new Tuple<int, byte>(p.ProjectileOwner.Self.Id, p.ProjectileId), out p);
            }
            else if (entity is StaticObject)
            {
                StaticObject dummy;
                StaticObjects.TryRemove(entity.Id, out dummy);
                if (entity is Decoy)
                    PlayersCollision.Remove(entity);
                else
                    EnemiesCollision.Remove(entity);
            }
            entity.Owner = null;
        }
        public Entity GetEntity(int id)
        {
            Player ret1;
            if (Players.TryGetValue(id, out ret1)) return ret1;
            Enemy ret2;
            if (Enemies.TryGetValue(id, out ret2)) return ret2;
            StaticObject ret3;
            if (StaticObjects.TryGetValue(id, out ret3)) return ret3;
            return null;
        }
        public Player GetUniqueNamedPlayer(string name)
        {
            foreach (var i in Players)
            {
                if (i.Value.NameChosen && i.Value.Name.Equals(name, StringComparison.InvariantCultureIgnoreCase))
                    return i.Value;
            }
            return null;
        }

        public void BroadcastPacket(Packet pkt, Player exclude)
        {
            foreach (var i in Players)
                if (i.Value != exclude)
                    i.Value.Client.SendPacket(pkt);
        }
        public void BroadcastPackets(IEnumerable<Packet> pkts, Player exclude)
        {
            foreach (var i in Players)
                if (i.Value != exclude)
                    i.Value.Client.SendPackets(pkts);
        }

        public virtual void Tick(RealmTime time)
        {
            try
            {
                if (IsLimbo) return;

                for (int i = 0; i < Timers.Count; i++)
                    if (Timers[i].Tick(this, time))
                    {
                        Timers.RemoveAt(i);
                        i--;
                    }

                foreach (var i in Players)
                    i.Value.Tick(time);

                if (EnemiesCollision != null)
                {
                    foreach (var i in EnemiesCollision.GetActiveChunks(PlayersCollision))
                        i.Tick(time);
                    foreach (var i in StaticObjects.Where(x => x.Value is Decoy))
                        i.Value.Tick(time);
                }
                else
                {
                    foreach (var i in Enemies)
                        i.Value.Tick(time);
                    foreach (var i in StaticObjects)
                        i.Value.Tick(time);
                }
                foreach (var i in Projectiles)
                    i.Value.Tick(time);
            }
            catch (Exception ex)
            {
                log.FatalFormat("Error in world {0}:\n{1}", Name, ex);
            }
        }

        protected string[] BuildMusic(params string[] args)
        {
            if (args == null)
                return new string[0];
            return args;
        }

        public ConcurrentDictionary<int, Enemy> Quests { get; private set; }
    }
}
