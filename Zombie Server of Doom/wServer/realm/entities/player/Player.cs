using log4net;
using Mono.Game;
using System;
using System.Collections.Generic;
using System.Linq;
using wServer.logic;
using wServer.networking;
using wServer.networking.svrPackets;
using wServer.realm.terrain;
using wServer.realm.worlds;

namespace wServer.realm.entities
{
    interface IPlayer
    {
        void Damage(int dmg, Character chr);
        bool IsVisibleToEnemy();
    }

    public partial class Player : Character, IContainer, IPlayer
    {
        private int hungercooldownremove;

        static ILog log = LogManager.GetLogger(typeof(Player));

        Client client;
        public Client Client { get { return client; } }

        //Stats
        public int AccountId { get; private set; }

        public int Experience { get; set; }
        public int ExperienceGoal { get; set; }
        public int Level { get; set; }
        public int AbilityCooldown { get; set; }
        public int SkinType { get; set; }

        public int CurrentFame { get; set; }
        public int Kills { get; set; }
        public int KillGoal { get; set; }
        public int Rank { get; set; }

        public string Guild { get; set; }
        public int GuildRank { get; set; }

        public int Credits { get; set; }
        public bool NameChosen { get; set; }
        public int Texture1 { get; set; }
        public int Texture2 { get; set; }

        public bool Glowing { get; set; }
        public int Hunger { get; set; }

        public int[] SlotTypes { get; private set; }
        public Inventory Inventory { get; private set; }
        public VisibilityManager Visibility { get; private set; }
        public int[] Stats { get; private set; }
        public int[] Boost { get; private set; }

        protected override void ExportStats(IDictionary<StatsType, object> stats)
        {
            base.ExportStats(stats);
            stats[StatsType.AccountId] = AccountId;

            stats[StatsType.Experience] = Experience - GetLevelExp(Level);
            stats[StatsType.ExperienceGoal] = ExperienceGoal;
            stats[StatsType.Level] = Level;

            stats[StatsType.CurrentFame] = CurrentFame;
            stats[StatsType.Fame] = Kills;
            stats[StatsType.FameGoal] = KillGoal;
            stats[StatsType.Rank] = Rank;

            stats[StatsType.Guild] = Guild;
            stats[StatsType.GuildRank] = GuildRank;

            stats[StatsType.Credits] = Credits;
            stats[StatsType.NameChosen] = NameChosen ? 1 : 0;
            stats[StatsType.Texture1] = Texture1;
            stats[StatsType.Texture2] = Texture2;

            stats[StatsType.Glowing] = -1;
            stats[StatsType.HP] = HP;
            stats[StatsType.MP] = Hunger;

            stats[StatsType.Inventory0] = (Inventory[0] != null ? Inventory[0].ObjectType : -1);
            stats[StatsType.Inventory1] = (Inventory[1] != null ? Inventory[1].ObjectType : -1);
            stats[StatsType.Inventory2] = (Inventory[2] != null ? Inventory[2].ObjectType : -1);
            stats[StatsType.Inventory3] = (Inventory[3] != null ? Inventory[3].ObjectType : -1);
            stats[StatsType.Inventory4] = (Inventory[4] != null ? Inventory[4].ObjectType : -1);
            stats[StatsType.Inventory5] = (Inventory[5] != null ? Inventory[5].ObjectType : -1);
            stats[StatsType.Inventory6] = (Inventory[6] != null ? Inventory[6].ObjectType : -1);
            stats[StatsType.Inventory7] = (Inventory[7] != null ? Inventory[7].ObjectType : -1);
            stats[StatsType.Inventory8] = (Inventory[8] != null ? Inventory[8].ObjectType : -1);
            stats[StatsType.Inventory9] = (Inventory[9] != null ? Inventory[9].ObjectType : -1);
            stats[StatsType.Inventory10] = (Inventory[10] != null ? Inventory[10].ObjectType : -1);
            stats[StatsType.Inventory11] = (Inventory[11] != null ? Inventory[11].ObjectType : -1);

            stats[StatsType.HasBackpack1] = Inventory.Length > 12 ? 1 : 0;
            stats[StatsType.HasBackpack2] = Inventory.Length > 20 ? 1 : 0;

            if (Inventory.Length > 12)
            {
                stats[StatsType.Backpack1_0] = (Inventory[12] != null ? Inventory[12].ObjectType : -1);
                stats[StatsType.Backpack1_1] = (Inventory[13] != null ? Inventory[13].ObjectType : -1);
                stats[StatsType.Backpack1_2] = (Inventory[14] != null ? Inventory[14].ObjectType : -1);
                stats[StatsType.Backpack1_3] = (Inventory[15] != null ? Inventory[15].ObjectType : -1);
                stats[StatsType.Backpack1_4] = (Inventory[16] != null ? Inventory[16].ObjectType : -1);
                stats[StatsType.Backpack1_5] = (Inventory[17] != null ? Inventory[17].ObjectType : -1);
                stats[StatsType.Backpack1_6] = (Inventory[18] != null ? Inventory[18].ObjectType : -1);
                stats[StatsType.Backpack1_7] = (Inventory[19] != null ? Inventory[19].ObjectType : -1);
            }

            if (Inventory.Length > 20)
            {
                stats[StatsType.Backpack2_0] = (Inventory[20] != null ? Inventory[20].ObjectType : -1);
                stats[StatsType.Backpack2_1] = (Inventory[21] != null ? Inventory[21].ObjectType : -1);
                stats[StatsType.Backpack2_2] = (Inventory[22] != null ? Inventory[22].ObjectType : -1);
                stats[StatsType.Backpack2_3] = (Inventory[23] != null ? Inventory[23].ObjectType : -1);
                stats[StatsType.Backpack2_4] = (Inventory[24] != null ? Inventory[24].ObjectType : -1);
                stats[StatsType.Backpack2_5] = (Inventory[25] != null ? Inventory[25].ObjectType : -1);
                stats[StatsType.Backpack2_6] = (Inventory[26] != null ? Inventory[26].ObjectType : -1);
                stats[StatsType.Backpack2_7] = (Inventory[27] != null ? Inventory[27].ObjectType : -1);
            }

            if (Boost == null) CalculateBoost();

            stats[StatsType.MaximumHP] = Stats[0] + Boost[0];
            stats[StatsType.MaximumMP] = Stats[1] + Boost[1];
            stats[StatsType.Attack] = Stats[2] + Boost[2];
            stats[StatsType.Defense] = Stats[3] + Boost[3];
            stats[StatsType.Speed] = Stats[4] + Boost[4];
            stats[StatsType.Vitality] = Stats[5] + Boost[5];
            stats[StatsType.Wisdom] = Stats[6] + Boost[6];
            stats[StatsType.Dexterity] = Stats[7] + Boost[7];

            stats[StatsType.HPBoost] = Boost[0];
            stats[StatsType.MPBoost] = Boost[1];
            stats[StatsType.AttackBonus] = Boost[2];
            stats[StatsType.DefenseBonus] = Boost[3];
            stats[StatsType.SpeedBonus] = Boost[4];
            stats[StatsType.VitalityBonus] = Boost[5];
            stats[StatsType.WisdomBonus] = Boost[6];
            stats[StatsType.DexterityBonus] = Boost[7];
            stats[StatsType.AbilityCooldown] = AbilityCooldown;
            stats[StatsType.SKIN_STAT] = SkinType;
            stats[StatsType.VisibilityRange] = Visibility.GetVisibility();
        }
        public void SaveToCharacter()
        {
            var chr = client.Character;
            chr.Exp = Experience;
            chr.SkinType = SkinType;
            chr.Level = Level;
            chr.Tex1 = Texture1;
            chr.Tex2 = Texture2;
            //chr.CurrentFame = Fame;
            if (Inventory.Length > 12)
            {
                chr.Backpack1 = new ushort[8]
                {
                    Inventory[12] != null ? Inventory[12].ObjectType : (ushort)0xffff,
                    Inventory[13] != null ? Inventory[13].ObjectType : (ushort)0xffff,
                    Inventory[14] != null ? Inventory[14].ObjectType : (ushort)0xffff,
                    Inventory[15] != null ? Inventory[15].ObjectType : (ushort)0xffff,
                    Inventory[16] != null ? Inventory[16].ObjectType : (ushort)0xffff,
                    Inventory[17] != null ? Inventory[17].ObjectType : (ushort)0xffff,
                    Inventory[18] != null ? Inventory[18].ObjectType : (ushort)0xffff,
                    Inventory[19] != null ? Inventory[19].ObjectType : (ushort)0xffff 
                };
                chr.Backpacks = 1;
            }
            if (Inventory.Length > 20)
            {
                chr.Backpack2 = new ushort[8]
                {
                    Inventory[20] != null ? Inventory[20].ObjectType : (ushort)0xffff,
                    Inventory[21] != null ? Inventory[21].ObjectType : (ushort)0xffff,
                    Inventory[22] != null ? Inventory[22].ObjectType : (ushort)0xffff,
                    Inventory[23] != null ? Inventory[23].ObjectType : (ushort)0xffff,
                    Inventory[24] != null ? Inventory[24].ObjectType : (ushort)0xffff,
                    Inventory[25] != null ? Inventory[25].ObjectType : (ushort)0xffff,
                    Inventory[26] != null ? Inventory[26].ObjectType : (ushort)0xffff,
                    Inventory[27] != null ? Inventory[27].ObjectType : (ushort)0xffff 
                };
                chr.Backpacks = 2;
            }

            chr.Equipment = new ushort[12]
            {
                Inventory[0] != null ? Inventory[0].ObjectType : (ushort)0xffff,
                Inventory[1] != null ? Inventory[1].ObjectType : (ushort)0xffff,
                Inventory[2] != null ? Inventory[2].ObjectType : (ushort)0xffff,
                Inventory[3] != null ? Inventory[3].ObjectType : (ushort)0xffff,
                Inventory[4] != null ? Inventory[4].ObjectType : (ushort)0xffff,
                Inventory[5] != null ? Inventory[5].ObjectType : (ushort)0xffff,
                Inventory[6] != null ? Inventory[6].ObjectType : (ushort)0xffff,
                Inventory[7] != null ? Inventory[7].ObjectType : (ushort)0xffff,
                Inventory[8] != null ? Inventory[8].ObjectType : (ushort)0xffff,
                Inventory[9] != null ? Inventory[9].ObjectType : (ushort)0xffff,
                Inventory[10] != null ? Inventory[10].ObjectType : (ushort)0xffff,
                Inventory[11] != null ? Inventory[11].ObjectType : (ushort)0xffff
            };

            chr.HitPoints = HP;
            chr.MagicPoints = Hunger;
            chr.MaxHitPoints = Stats[0];
            chr.MaxMagicPoints = Stats[1];
            chr.Attack = Stats[2];
            chr.Defense = Stats[3];
            chr.Speed = Stats[4];
            chr.HpRegen = Stats[5];
            chr.MpRegen = Stats[6];
            chr.Dexterity = Stats[7];
        }

        public void SaveToAccount()
        {
            var acc = client.Account;
            acc.Name = Name;
            acc.Kills = Kills;
        }

        void CalculateBoost()
        {
            if (Boost == null) Boost = new int[12];
            else
                for (int i = 0; i < Boost.Length; i++) Boost[i] = 0;
            for (int i = 0; i < 4; i++)
            {
                if (Inventory[i] == null) continue;
                foreach (var b in Inventory[i].StatsBoost)
                {
                    switch ((StatsType)b.Key)
                    {
                        case StatsType.MaximumHP: Boost[0] += b.Value; break;
                        case StatsType.MaximumMP: Boost[1] += b.Value; break;
                        case StatsType.Attack: Boost[2] += b.Value; break;
                        case StatsType.Defense: Boost[3] += b.Value; break;
                        case StatsType.Speed: Boost[4] += b.Value; break;
                        case StatsType.Vitality: Boost[5] += b.Value; break;
                        case StatsType.Wisdom: Boost[6] += b.Value; break;
                        case StatsType.Dexterity: Boost[7] += b.Value; break;
                    }
                }
            }
        }


        StatsManager statsMgr;
        public Player(Client client)
            : base(client.Manager, 0x030e, client.Random)
        {
            this.client = client;
            statsMgr = new StatsManager(this);
            Name = client.Account.Name;
            AccountId = client.Account.AccountId;

            SkinType = client.Character.SkinType;
            Level = client.Character.Level;
            Experience = client.Character.Exp;
            ExperienceGoal = GetExpGoal(client.Character.Level);
            Rank = client.Account.Rank;
            Texture1 = client.Character.Tex1;
            Texture2 = client.Character.Tex2;
            Credits = client.Account.Credits;
            NameChosen = client.Account.NameChosen;
            CurrentFame = client.Account.Stats.Fame;
            Kills = client.Account.Kills;
            EnemyKilled(null);
            Glowing = true;
            Guild = "";
            GuildRank = -1;
            HP = client.Character.HitPoints;
            Hunger = client.Character.MagicPoints;
            ConditionEffects = 0;

            Inventory = new Inventory(this,
                client.Character.Equipment
                    .Select(_ => _ == 0xffff ? null : client.Manager.GameData.Items[_])
                    .ToArray());
            Inventory.InventoryChanged += (sender, e) => CalculateBoost();
            SlotTypes = Utils.FromCommaSepString32(client.Manager.GameData.ObjectTypeToElement[ObjectType].Element("SlotTypes").Value);
            Stats = new int[]
            {
                client.Character.MaxHitPoints,
                client.Character.MaxMagicPoints,
                client.Character.Attack,
                client.Character.Defense,
                client.Character.Speed,
                client.Character.HpRegen,
                client.Character.MpRegen,
                client.Character.Dexterity,
            };
            if (client.Character.Backpacks >= 1)
            {
                Inventory.SetItems(Inventory.Concat(client.Character.Backpack1.Select(_ => _ == 0xffff ? null : client.Manager.GameData.Items[_])).ToArray());
                SlotTypes = SlotTypes.Concat(new int[8] { 0, 0, 0, 0, 0, 0, 0, 0 }).ToArray();
            }
            if (client.Character.Backpacks == 2)
            {
                Inventory.SetItems(Inventory.Concat(client.Character.Backpack2.Select(_ => _ == 0xffff ? null : client.Manager.GameData.Items[_])).ToArray());
                SlotTypes = SlotTypes.Concat(new int[8] { 0, 0, 0, 0, 0, 0, 0, 0 }).ToArray();
            }

            Visibility = new VisibilityManager(this);
        }

        byte[,] tiles;
        FameCounter fames;
        public FameCounter FameCounter { get { return fames; } }

        public override void Init(World owner)
        {
            Random rand = new System.Random();
            if (!(owner is GameWorld))
            {
                int x, y;
                do
                {
                    x = rand.Next(0, owner.Map.Width);
                    y = rand.Next(0, owner.Map.Height);
                } while (owner.Map[x, y].Region != TileRegion.Spawn);
                Move(x + 0.5f, y + 0.5f);
            }
            else Move(4096 / 2, 4096 / 2);
            
            tiles = new byte[owner.Map.Width, owner.Map.Height];
            fames = new FameCounter(this);
            SetNewbiePeriod();
            _hungertime = HUNGERCOOLDOWNMS;
            AbilityCooldown = Inventory[1] == null ? 0 : Inventory[1].MpCost;
            base.Init(owner);
        }

        public override void Tick(RealmTime time)
        {
            if (client.Stage == ProtocalStage.Disconnected)
            {
                Owner.LeaveWorld(this);
                return;
            }
            if (!KeepAlive(time)) return;

            if (Boost == null) CalculateBoost();

            if (Hunger < 0) Hunger = 0;

            CheckTradeTimeout(time);
            HandleRegen(time);
            HandleQuest(time);
            HandleGround(time);
            HandleEffects(time);
            HandleHunger(time);
            fames.Tick(time);

            SendUpdate(time);

            if (HP <= 0)
            {
                Death("Unknown");
                return;
            }

            base.Tick(time);
        }

        float hpRegenCounter;
        float mpRegenCounter;
        void HandleRegen(RealmTime time)
        {
            if (HP == Stats[0] + Boost[0] || !CanHpRegen())
                hpRegenCounter = 0;
            else
            {
                hpRegenCounter += statsMgr.GetHPRegen() * time.thisTickTimes / 1000f;
                int regen = (int)hpRegenCounter;
                if (regen > 0)
                {
                    HP = Math.Min(Stats[0] + Boost[0], HP + regen);
                    hpRegenCounter -= regen;
                    UpdateCount++;
                }
            }

            //if (Hunger == Stats[1] + Boost[1] || !CanMpRegen())
            //    mpRegenCounter = 0;
            //else
            //{
            //    mpRegenCounter += statsMgr.GetMPRegen() * time.thisTickTimes / 1000f;
            //    int regen = (int)mpRegenCounter;
            //    if (regen > 0)
            //    {
            //        Hunger = Math.Min(Stats[1] + Boost[1], Hunger + regen);
            //        mpRegenCounter -= regen;
            //        UpdateCount++;
            //    }
            //}
        }

        public void Teleport(RealmTime time, int objId)
        {
            if (!this.TPCooledDown())
            {
                SendError("Too soon to teleport again!");
                return;
            }
            SetTPDisabledPeriod();
            var obj = Owner.GetEntity(objId);
            if (obj == null) return;
            Move(obj.X, obj.Y);
            fames.Teleport();
            SetNewbiePeriod();
            UpdateCount++;
            Owner.BroadcastPacket(new GotoPacket()
            {
                ObjectId = Id,
                Position = new Position()
                {
                    X = X,
                    Y = Y
                }
            }, null);
            Owner.BroadcastPacket(new ShowEffectPacket()
            {
                EffectType = EffectType.Teleport,
                TargetId = Id,
                PosA = new Position()
                {
                    X = X,
                    Y = Y
                },
                Color = new ARGB(0xFFFFFFFF)
            }, null);
        }

        public override bool HitByProjectile(Projectile projectile, RealmTime time)
        {
            if (projectile.ProjectileOwner is Player ||
                HasConditionEffect(ConditionEffects.Paused) ||
                HasConditionEffect(ConditionEffects.Stasis) ||
                HasConditionEffect(ConditionEffects.Invincible))
                return false;

            var dmg = (int)statsMgr.GetDefenseDamage(projectile.Damage, projectile.Descriptor.ArmorPiercing);
            if (!HasConditionEffect(ConditionEffects.Invulnerable))
                HP -= dmg;
            ApplyConditionEffect(projectile.Descriptor.Effects);
            UpdateCount++;
            Owner.BroadcastPacket(new DamagePacket()
            {
                TargetId = this.Id,
                Effects = HasConditionEffect(ConditionEffects.Invincible) ? 0 : projectile.ConditionEffects,
                Damage = (ushort)dmg,
                Killed = HP <= 0,
                BulletId = projectile.ProjectileId,
                ObjectId = projectile.ProjectileOwner.Self.Id
            }, this);

            if (HP <= 0) Death(
                projectile.ProjectileOwner.Self.ObjectDesc.DisplayId ??
                projectile.ProjectileOwner.Self.ObjectDesc.ObjectId);

            return base.HitByProjectile(projectile, time);
        }

        public void Damage(int dmg, Character chr)
        {
            if (HasConditionEffect(ConditionEffects.Paused) ||
                HasConditionEffect(ConditionEffects.Stasis) ||
                HasConditionEffect(ConditionEffects.Invincible))
                return;

            dmg = (int)statsMgr.GetDefenseDamage(dmg, false);
            if (!HasConditionEffect(ConditionEffects.Invulnerable))
                HP -= dmg;
            UpdateCount++;
            Owner.BroadcastPacket(new DamagePacket()
            {
                TargetId = this.Id,
                Effects = 0,
                Damage = (ushort)dmg,
                Killed = HP <= 0,
                BulletId = 0,
                ObjectId = chr.Id
            }, this);

            if (HP <= 0) Death(
                chr.ObjectDesc.DisplayId ??
                chr.ObjectDesc.ObjectId);
        }

        bool resurrecting = false;
        bool CheckResurrection()
        {
            for (int i = 0; i < 4; i++)
            {
                Item item = Inventory[i];
                if (item == null || !item.Resurrects) continue;

                HP = Stats[0] + Stats[0];
                Hunger = Stats[1] + Stats[1];
                Inventory[i] = null;
                foreach (var player in Owner.Players.Values)
                    player.SendInfo(string.Format("{0}'s {1} breaks and he disappears", Name, item.ObjectId));

                client.Reconnect(new ReconnectPacket()
                {
                    Host = "",
                    Port = 2050,
                    GameId = World.NEXUS_ID,
                    Name = "Nexus",
                    Key = Empty<byte>.Array,
                });

                resurrecting = true;
                return true;
            }
            return false;
        }
        void GenerateGravestone()
        {
            int maxed = 0;
            foreach (var i in Manager.GameData.ObjectTypeToElement[ObjectType].Elements("LevelIncrease"))
            {
                int limit = int.Parse(Manager.GameData.ObjectTypeToElement[ObjectType].Element(i.Value).Attribute("max").Value);
                int idx = StatsManager.StatsNameToIndex(i.Value);
                if (Stats[idx] >= limit)
                    maxed++;
            }

            ushort objType;
            int? time;
            switch (maxed)
            {
                case 8:
                    objType = 0x0735; time = null;
                    break;
                case 7:
                    objType = 0x0734; time = null;
                    break;
                case 6:
                    objType = 0x072b; time = null;
                    break;
                case 5:
                    objType = 0x072a; time = null;
                    break;
                case 4:
                    objType = 0x0729; time = null;
                    break;
                case 3:
                    objType = 0x0728; time = null;
                    break;
                case 2:
                    objType = 0x0727; time = null;
                    break;
                case 1:
                    objType = 0x0726; time = null;
                    break;
                default:
                    if (Level <= 1)
                    {
                        objType = 0x0723; time = 30 * 1000;
                    }
                    else if (Level < 20)
                    {
                        objType = 0x0724; time = 60 * 1000;
                    }
                    else
                    {
                        objType = 0x0725; time = 5 * 60 * 1000;
                    }
                    break;
            }
            StaticObject obj = new StaticObject(Manager, objType, time, true, time == null ? false : true, false);
            obj.Move(X, Y);
            obj.Name = this.Name;
            Owner.EnterWorld(obj);
        }

        public void Death(string killer)
        {
            if (client.Stage == ProtocalStage.Disconnected || resurrecting)
                return;
            if (CheckResurrection())
                return;


            if (client.Character.Dead)
            {
                client.Disconnect();
                return;
            }

            GenerateGravestone();
            foreach (var i in Owner.Players.Values)
                i.SendInfo(Name + " died at Level " + Level + ", killed by " + killer);

            client.Character.Dead = true;
            SaveToCharacter();
            Manager.Database.SaveCharacter(client.Account, client.Character);
            Manager.Database.Death(Manager.GameData, client.Account, client.Character, killer);
            client.SendPacket(new DeathPacket()
            {
                AccountId = AccountId,
                CharId = client.Character.CharacterId,
                Killer = killer
            });
            Owner.Timers.Add(new WorldTimer(1000, (w, t) => client.Disconnect()));
            Owner.LeaveWorld(this);
        }

        public override Entity Move(float x, float y)
        {
            if (X != 0 && Y != 0)
            {
                Vector2 targetPosition = new Vector2(x, y);
                Vector2 curPosition = new Vector2(X, Y);

                hungercooldownremove = (int)((Vector2.Distance(curPosition, targetPosition) * (Stats[4] + Boost[4])));
            }
            Visibility.Move(x, y);
            return base.Move(x, y);
        }
    }
}