using db;
using log4net;
using log4net.Config;
using System;
using System.Globalization;
using System.IO;
using System.Threading;
using wServer.networking;
using wServer.realm;

namespace wServer
{
    static class Program
    {
        internal static SimpleSettings Settings;

        static ILog log = LogManager.GetLogger("Server");

        static void Main(string[] args)
        {
            XmlConfigurator.ConfigureAndWatch(new FileInfo("log4net.config"));

            Thread.CurrentThread.CurrentCulture = CultureInfo.InvariantCulture;
            Thread.CurrentThread.Name = "Entry";

            using (Settings = new SimpleSettings("wServer"))
            {
                var db = new Database(Settings.GetValue("conn"));
                RealmManager manager = new RealmManager(
                    Settings.GetValue<int>("maxClient", "100"),
                    Settings.GetValue<int>("tps", "20"),
                    db);

                manager.Initialize();
                manager.Run();

                Server server = new Server(manager, 2050);
                PolicyServer policy = new PolicyServer();

                Console.CancelKeyPress += (sender, e) => e.Cancel = true;

                policy.Start();
                server.Start();
                log.Info("Server initialized.");

                while (Console.ReadKey(true).Key != ConsoleKey.Escape) ;

                log.Info("Terminating...");
                server.Stop();
                policy.Stop();
                manager.Stop();
                db.Dispose();
                log.Info("Server terminated.");
            }
        }
    }
}
