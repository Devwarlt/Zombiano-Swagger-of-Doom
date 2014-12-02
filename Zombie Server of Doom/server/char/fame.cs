using db;
using System.IO;

namespace server.@char
{
    public class fame : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                var acc = db.GetAccount(int.Parse(Query["accountId"]));
                var chr = db.LoadCharacter(acc, int.Parse(Query["charId"]));

                var cmd = db.CreateQuery();
                cmd.CommandText = @"SELECT time, killer, firstBorn FROM death WHERE accId=@accId AND chrId=@charId;";
                cmd.Parameters.AddWithValue("@accId", Query["accountId"]);
                cmd.Parameters.AddWithValue("@charId", Query["charId"]);
                int time = 0;
                string killer = "";
                bool firstBorn = false;
                using (var rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        time = Database.DateTimeToUnixTimestamp(rdr.GetDateTime("time"));
                        killer = rdr.GetString("killer");
                        firstBorn = rdr.GetBoolean("firstBorn");
                    }
                }

                using (StreamWriter wtr = new StreamWriter(Context.Response.OutputStream))
                    wtr.Write(chr.FameStats.Serialize(Program.GameData, acc, chr, time, killer, firstBorn));
            }
        }
    }
}
