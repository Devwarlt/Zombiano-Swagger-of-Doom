using db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer
{
    public static class FireAnalytics
    {
        public static void TrackAction(Player player, string action)
        {
            switch (action)
            {
                case FireAnalyticsActions.EnterWorld:
                    if (!player.Nation.Choosen) checkForAchievement(player, FireAnalyticsActions.ChoosedNation);
                    if (player.Owner.Name == "America") checkForAchievement(player, FireAnalyticsActions.VisitAmerica);
                    return;
                case FireAnalyticsActions.PlayerKilled:
                    //TODO: Implement Counter
                    break;
            }

            checkForAchievement(player, action);
        }

        private static void checkForAchievement(Player player, string action)
        {
            var id = fireAnalyticsHelper.resolveAchievementIdFromName(action);
            if (id == -1) return;
            if (player.Client.Account.AchievementData.Count(_ => _.AchievementId == id) == 0)
            {
                using (var db = new Database(Program.Settings.GetValue<string>("conn")))
                {
                    var cmd = db.CreateQuery();
                    cmd.CommandText = "SELECT * FROM achievements WHERE id=@id;";
                    cmd.Parameters.AddWithValue("@id", id);
                    using (var rdr = cmd.ExecuteReader())
                    {
                        if (!rdr.HasRows || !rdr.Read()) return;

                        player.Client.Account.AchievementData.Add(new AchievementUtils.AchievementStruct
                        {
                            AchievementId = id,
                            CompletedAt = Database.DateTimeToUnixTimestamp(DateTime.Now)
                        });

                        player.Client.SendPacket(new AchievementUnlockedPacket
                        {
                            Type = AchievementUnlockedPacket.AchievementType.Normal,
                            Title = rdr.GetString("title"),
                            Description = rdr.GetString("desc")
                        });
                    }
                }
            }
        }

        private static class fireAnalyticsHelper
        {
            public static int resolveAchievementIdFromName(string name)
            {
                switch (name)
                {
                    case FireAnalyticsActions.EnterTutorial: return 1;
                    case FireAnalyticsActions.CompleteTutorial: return 2;
                    case FireAnalyticsActions.LootbagPickup: return 3;
                    case FireAnalyticsActions.PlayerKilled: return 4;
                    case FireAnalyticsActions.ChooseName: return 5;
                    case FireAnalyticsActions.MonsterKilled: return 6;
                    case FireAnalyticsActions.PfcRankReached: return 7;
                    case FireAnalyticsActions.CreateVillage: return 8;
                    case FireAnalyticsActions.JoinOtherVillage: return 9;
                    case FireAnalyticsActions.VisitAmerica: return 10;
                    case FireAnalyticsActions.URCOOL: return 11;
                    case FireAnalyticsActions.SpcRankReached: return 12;
                    case FireAnalyticsActions.CraftItem: return 13;
                    case FireAnalyticsActions.ChoosedNation: return 14;
                }
                return -1;
            }
        }
    }

    public static class FireAnalyticsActions
    {
        public const string EnterTutorial =             "enterTutorial";
        public const string CompleteTutorial =          "completeTutorial";
        public const string LootbagPickup =             "lootBagPickUp";
        public const string PlayerKilled =              "playerKilled";
        public const string ChooseName =                "chooseName";
        public const string MonsterKilled =             "monsterKilled";
        public const string PfcRankReached =            "reachedPfcRank";
        public const string CreateVillage =             "createVillage";
        public const string JoinOtherVillage =          "otherVillageJoin";
        public const string VisitAmerica =              "americaVisit";
        public const string URCOOL =                    "URCOOL";
        public const string SpcRankReached =            "reachedSpcRank";
        public const string CraftItem =                 "craftItem";

        public const string OwnPlayerKilledByMonster =  "ownPlayerKilledByMonster";
        public const string OwnPlayerKilledByPlayer =   "ownPlayerKilledByPlayer";
        public const string EnterPortal =               "enterPortal";
        public const string ChoosedNation =             "choosedNation";


        public const string EnterWorld =                "enterWorld";
    }
}
