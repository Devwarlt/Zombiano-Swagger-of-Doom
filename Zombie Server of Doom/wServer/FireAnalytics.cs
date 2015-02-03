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
        public static void TrackAction(Player player, AchievementGUID action)
        {
            if(action == AchievementGUID.EnterWorld)
            {
                if (player.Nation.Choosen) checkForAchievement(player, AchievementGUID.ChoosedNation);
                if (player.Owner.Name == "America") checkForAchievement(player, AchievementGUID.VisitAmerica);
                return;
            }
            else if (action == AchievementGUID.PlayerKilled)
            {
                //TODO: Implement Counter
            }

            checkForAchievement(player, action);
        }

        private static void checkForAchievement(Player player, AchievementGUID action)
        {
            var achievement = Achievement.GetAchievementWithGUID(action);
            if (achievement.UnknownAchievement) return;

            if (player != null && player.Client != null &&
                player.Client.Account != null && player.Client.Account.AchievementData != null)
            {
                if (player.Client.Account.AchievementData.Count(_ => _.AchievementId == achievement.ID) == 0)
                {
                    player.Client.Account.AchievementData.Add(new AchievementUtils.AchievementStruct
                    {
                        AchievementId = achievement.ID,
                        CompletedAt = Database.DateTimeToUnixTimestamp(DateTime.Now)
                    });

                    player.Client.SendPacket(new AchievementUnlockedPacket
                    {
                        Type = AchievementUnlockedPacket.AchievementType.Normal,
                        Title = achievement.Title,
                        Description = achievement.Description
                    });
                }
            }
        }
    }
}
