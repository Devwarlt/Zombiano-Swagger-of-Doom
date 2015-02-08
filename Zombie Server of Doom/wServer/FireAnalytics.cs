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
                if (player.Client.Account.OwnedSkins.Contains(0x0343))
                {
                    if (checkForAchievement(player, AchievementGUID.Unicorn))
                    {
                        player.Client.SendPacket(new UnlockPacket
                        {
                            Type = UnlockType.Item,
                            ItemId = 0x0343
                        });
                    }
                }
                return;
            }
            else if (action == AchievementGUID.PlayerKilled)
            {
                //TODO: Implement Counter
            }

            checkForAchievement(player, action);
        }

        private static bool checkForAchievement(Player player, AchievementGUID action)
        {
            var achievement = Achievement.GetAchievementWithGUID(action);
            if (achievement.UnknownAchievement) return false;

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

                    return true;
                }
            }
            return false;
        }
    }
}
