using db;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Web;

namespace server.@char
{
    class fame : IRequestHandler
    {
        public void HandleRequest(HttpListenerContext context)
        {
            NameValueCollection query;
            using (StreamReader rdr = new StreamReader(context.Request.InputStream))
                query = HttpUtility.ParseQueryString(rdr.ReadToEnd());

            if (query.AllKeys.Length == 0)
            {
                string currurl = context.Request.RawUrl;
                int iqs = currurl.IndexOf('?');
                if (iqs >= 0)
                {
                    query = HttpUtility.ParseQueryString((iqs < currurl.Length - 1) ? currurl.Substring(iqs + 1) : string.Empty);
                }
            }

            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                var acc = db.GetAccount(int.Parse(query["accountId"]));
                var chr = db.LoadCharacter(acc, int.Parse(query["charId"]));

                var cmd = db.CreateQuery();
                cmd.CommandText = @"SELECT time, killer, firstBorn FROM death WHERE accId=@accId AND chrId=@charId;";
                cmd.Parameters.AddWithValue("@accId", query["accountId"]);
                cmd.Parameters.AddWithValue("@charId", query["charId"]);
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

                using (StreamWriter wtr = new StreamWriter(context.Response.OutputStream))
                    wtr.Write(chr.FameStats.Serialize(Program.GameData, acc, chr, time, killer, firstBorn));
            }
        }
    }
}
