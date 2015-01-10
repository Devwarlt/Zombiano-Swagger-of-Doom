
namespace wServer.realm.worlds
{
    public class Nexus : World
    {
        public Nexus()
        {
            Id = NEXUS_ID;
            Name = "Himalayas";
            Background = 2;
            Music = BuildMusic("sorc", "sorc2", "Menu", "Menu2");
            Weather = Weather.Snowy;
        }

        protected override void Init()
        {
            base.FromWorldMap(typeof(RealmManager).Assembly.GetManifestResourceStream("wServer.realm.worlds.nexus.wmap"));
        }
    }
}
