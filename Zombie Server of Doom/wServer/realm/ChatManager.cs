using log4net;
using wServer.networking.svrPackets;
using wServer.realm.entities;

namespace wServer.realm
{
    public class ChatManager
    {
        static ILog log = LogManager.GetLogger(typeof(ChatManager));

        RealmManager manager;
        public ChatManager(RealmManager manager)
        {
            this.manager = manager;
        }

        public void Say(Player src, string text)
        {
            if (text.ToLower() == "u r cool")
                FireAnalytics.TrackAction(src, AchievementGUID.URCOOL);

            src.Owner.BroadcastPacket(new TextPacket()
            {
                Name = (src.Client.Account.Admin ? "@" : "") + src.Name,
                ObjectId = src.Id,
                Stars = src.Rank,
                BubbleTime = 5,
                Recipient = "",
                Text = text,
                CleanText = text,
                Premium = src.Premium
            }, null);
            log.InfoFormat("[{0}({1})] <{2}> {3}", src.Owner.Name, src.Owner.Id, src.Name, text);
        }

        public void Announce(string text)
        {
            foreach (var i in manager.Clients.Values)
                i.SendPacket(new TextPacket()
                {
                    BubbleTime = 0,
                    Stars = -1,
                    Name = "@Announcement",
                    Text = text
                });
            log.InfoFormat("<Announcement> {0}", text);
        }

        public void Oryx(World world, string text)
        {
            world.BroadcastPacket(new TextPacket()
            {
                BubbleTime = 0,
                Stars = -1,
                Name = "#Oryx the Mad God",
                Text = text
            }, null);
            log.InfoFormat("[{0}({1})] <Oryx the Mad God> {2}", world.Name, world.Id, text);
        }
    }
}
