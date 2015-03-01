using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using wServer.logic;
using wServer.realm.entities;

namespace wServer.realm
{
    public class Entity : IProjectileOwner, ICollidable<Entity>
    {
        static ILog log = LogManager.GetLogger(typeof(Entity));

        private Dictionary<StatsType, object> m_old_stats;
        private Dictionary<StatsType, object> m_new_stats;

        public RealmManager Manager { get; private set; }
        protected Entity(RealmManager manager, ushort objType)
        {
            this.m_old_stats = new Dictionary<StatsType, object>();
            this.m_new_stats = new Dictionary<StatsType, object>();

            this.ObjectType = objType;
            Name = "";
            Size = 100;
            Manager = manager;
            manager.Behaviors.ResolveBehavior(this);

            manager.GameData.ObjectDescs.TryGetValue(ObjectType, out desc);
            if (desc != null)
            {
                if (desc.Player || desc.Enemy)
                {
                    posHistory = new Position[256];
                    projectiles = new Projectile[256];
                    effects = new int[EFFECT_COUNT];
                }

                Size = desc.MinSize;
            }
        }


        ObjectDesc desc;
        public ObjectDesc ObjectDesc { get { return desc; } }

        public World Owner { get; internal set; }

        public int UpdateCount { get; set; }

        public ushort ObjectType { get; private set; }
        public int Id { get; internal set; }
        public float X { get; private set; }
        public float Y { get; private set; }


        public CollisionNode<Entity> CollisionNode { get; set; }
        public CollisionMap<Entity> Parent { get; set; }
        public virtual Entity Move(float x, float y)
        {
            if (Owner != null && !(this is Projectile) &&
                (!(this is StaticObject) || (this as StaticObject).Hittestable))
                (this is Enemy ? Owner.EnemiesCollision : Owner.PlayersCollision)
                    .Move(this, x, y);
            X = x; Y = y;
            return this;
        }


        //Stats
        public string Name { get; set; }
        public int Size { get; set; }
        public ConditionEffects ConditionEffects { get; set; }

        protected virtual void ExportEntityStats()
        {
            ExportStatIfChanged(StatsType.Name, Name ?? "");
            ExportStatIfChanged(StatsType.Size, Size);
            ExportStatIfChanged(StatsType.Effects, (int)ConditionEffects);
        }

        protected void ExportStatIfChanged(StatsType type, object value)
        {
            if (value == null) return;
            if (!this.m_new_stats.ContainsKey(type))
                this.m_new_stats.Add(type, value);
            else
            {
                if (this.m_new_stats[type] != value)
                    this.m_new_stats[type] = value;
            }
        }

        public ObjectStats ExportStats()
        {
            ExportEntityStats();
            Dictionary<StatsType, object> stats = new Dictionary<StatsType, object>();

            foreach (var stat in this.m_new_stats)
            {
                stats.Add(stat.Key, stat.Value);
                //if (stat.Value == null) continue;
                //
                //if (!this.m_old_stats.ContainsKey(stat.Key))
                //{
                //    stats.Add(stat.Key, stat.Value);
                //    this.m_old_stats.Add(stat.Key, stat.Value);
                //}
                //else if (!this.m_old_stats[stat.Key].Equals(stat.Value))
                //{
                //    stats.Add(stat.Key, stat.Value);
                //    this.m_old_stats[stat.Key] = stat.Value;
                //}
            }
            if (stats.Count > 0)
            {
                Console.WriteLine(stats.Count);
            }
            return new ObjectStats()
            {
                Id = Id,
                Position = new Position() { X = X, Y = Y },
                Stats = stats.ToArray()
            };
        }
        public ObjectDef ToDefinition()
        {
            return new ObjectDef()
            {
                ObjectType = ObjectType,
                Stats = ExportStats()
            };
        }

        public virtual void Init(World owner)
        {
            Owner = owner;
        }
        Position[] posHistory;
        byte posIdx = 0;
        public virtual void Tick(RealmTime time)
        {
            if (this is Projectile || Owner == null) return;
            if (CurrentState != null && Owner != null)
            {
                if (!HasConditionEffect(ConditionEffects.Stasis))
                    TickState(time);
            }
            if (posHistory != null)
                posHistory[posIdx++] = new Position() { X = X, Y = Y };
            if (effects != null)
                ProcessConditionEffects(time);
        }


        Dictionary<object, object> states;
        public IDictionary<object, object> StateStorage
        {
            get
            {
                if (states == null) states = new Dictionary<object, object>();
                return states;
            }
        }

        public State CurrentState { get; private set; }
        public void SwitchTo(State state)
        {
            var origState = CurrentState;

            CurrentState = state;
            GoDeeeeeeeep();

            stateEntryCommonRoot = State.CommonParent(origState, CurrentState);
            stateEntry = true;
        }
        void GoDeeeeeeeep()
        {
            //always the first deepest sub-state
            if (CurrentState == null) return;
            while (CurrentState.States.Count > 0)
                CurrentState = CurrentState = CurrentState.States[0];
        }

        bool stateEntry = false;
        State stateEntryCommonRoot = null;
        void TickState(RealmTime time)
        {
            if (stateEntry)
            {
                //State entry
                var s = CurrentState;
                while (s != null && s != stateEntryCommonRoot)
                {
                    foreach (var i in s.Behaviors)
                        i.OnStateEntry(this, time);
                    s = s.Parent;
                }
                stateEntryCommonRoot = null;
                stateEntry = false;
            }

            var origState = CurrentState;
            var state = CurrentState;
            bool transited = false;
            while (state != null)
            {
                if (!transited)
                    foreach (var i in state.Transitions)
                        if (i.Tick(this, time))
                        {
                            transited = true;
                            break;
                        }

                foreach (var i in state.Behaviors)
                {
                    if (Owner == null) break;
                    i.Tick(this, time);
                }
                if (Owner == null) break;

                state = state.Parent;
            }
            if (transited)
            {
                //State exit
                var s = origState;
                while (s != null && s != stateEntryCommonRoot)
                {
                    foreach (var i in s.Behaviors)
                        i.OnStateExit(this, time);
                    s = s.Parent;
                }
            }
        }


        public Position? TryGetHistory(long timeAgo)
        {
            if (posHistory == null) return null;
            long tickPast = timeAgo * Manager.Logic.TPS / 1000;
            if (tickPast > 255) return null;
            return posHistory[(byte)(posIdx - (byte)tickPast)];
        }


        /* Projectile
         * Sign
         * Wall
         * ConnectedWall
         * MoneyChanger
         * CharacterChanger
         * Stalagmite
         * NameChanger
         * GuildRegister
         * GuildChronicle
         * GuildBoard
         * CaveWall
         * Player
         * Dye
         * ClosedVaultChest
         * Merchant
         * GuildHallPortal
         * SpiderWeb
         * GuildMerchant
         * Portal
         * Equipment
         * Container
         * GameObject
         * Character
         */
        public static Entity Resolve(RealmManager manager, string name)
        {
            ushort id;
            if (!manager.GameData.IdToObjectType.TryGetValue(name, out id))
                return null;
            else
                return Resolve(manager, id);
        }
        public static Entity Resolve(RealmManager manager, ushort id)
        {
            var node = manager.GameData.ObjectTypeToElement[id];
            string type = node.Element("Class").Value;
            switch (type)
            {
                case "Projectile":
                    throw new Exception("Projectile should not instantiated using Entity.Resolve");
                case "Sign":
                    return new Sign(manager, id);
                case "Wall":
                    return new Wall(manager, id, node);
                case "ConnectedWall":
                case "CaveWall":
                    return new ConnectedObject(manager, id);
                case "GameObject":
                case "CharacterChanger":
                case "MoneyChanger":
                case "NameChanger":
                    return new StaticObject(manager, id, StaticObject.GetHP(node), true, false, true);
                case "Container":
                    return new Container(manager, id);
                case "Player":
                    throw new Exception("Player should not instantiated using Entity.Resolve");
                case "Character":   //Other characters means enemy
                    return new Enemy(manager, id);
                case "Portal":
                    return new Portal(manager, id, null);
                case "ClosedVaultChest":
                case "GuildMerchant":
                    return new SellableObject(manager, id);

                case "VillageRegister":
                case "CraftingTerminal":
                case "Forge":
                case "Door":
                case "CraftingRecipeBook":
                case "ReskinVendor":
                    return new StaticObject(manager, id, null, true, false, true);

                case "GuildHallPortal":
                //return new StaticObject(id);
                default:
                    log.WarnFormat("Not supported type: {0}", type);
                    return new Entity(manager, id);
            }
        }

        Entity IProjectileOwner.Self { get { return this; } }

        Projectile[] projectiles;
        Projectile[] IProjectileOwner.Projectiles { get { return projectiles; } }
        protected byte projectileId;
        public Projectile CreateProjectile(ProjectileDesc desc, ushort container, int dmg, long time, Position pos, float angle)
        {
            var ret = new Projectile(Manager, desc) //Assume only one
            {
                ProjectileOwner = this,
                ProjectileId = projectileId++,
                Container = container,
                Damage = dmg,

                BeginTime = time,
                BeginPos = pos,
                Angle = angle,

                X = pos.X,
                Y = pos.Y
            };
            if (projectiles[ret.ProjectileId] != null)
                projectiles[ret.ProjectileId].Destroy(true);
            projectiles[ret.ProjectileId] = ret;
            return ret;
        }
        public virtual bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            //Console.WriteLine("HIT! " + Id);
            if (ObjectDesc == null)
                return true;
            else
                return ObjectDesc.Enemy || ObjectDesc.Player;
        }
        public virtual void ProjectileHit(Projectile projectile, Entity target)
        {
        }



        const int EFFECT_COUNT = 28;
        int[] effects;
        bool tickingEffects = false;

        void ProcessConditionEffects(RealmTime time)
        {
            if (effects == null || !tickingEffects) return;

            ConditionEffects newEffects = 0;
            tickingEffects = false;
            for (int i = 0; i < effects.Length; i++)
                if (effects[i] > 0)
                {
                    effects[i] -= time.thisTickTimes;
                    if (effects[i] > 0)
                        newEffects |= (ConditionEffects)(1 << i);
                    else
                        effects[i] = 0;
                    tickingEffects = true;
                }
                else if (effects[i] != 0)
                    newEffects |= (ConditionEffects)(1 << i);
            if (newEffects != ConditionEffects)
            {
                ConditionEffects = newEffects;
                UpdateCount++;
            }
        }

        public bool HasConditionEffect(ConditionEffects eff)
        {
            return (ConditionEffects & eff) != 0;
        }
        public void ApplyConditionEffect(params ConditionEffect[] effs)
        {
            foreach (var i in effs)
            {
                if (i.Effect == ConditionEffectIndex.Stunned &&
                    HasConditionEffect(ConditionEffects.StunImmume))
                    continue;
                if (i.Effect == ConditionEffectIndex.Stasis &&
                    HasConditionEffect(ConditionEffects.StasisImmune))
                    continue;
                effects[(int)i.Effect] = i.DurationMS;
                if (i.DurationMS != 0)
                    ConditionEffects |= (ConditionEffects)(1 << (int)i.Effect);
            }
            tickingEffects = true;
            UpdateCount++;
        }
    }
}
