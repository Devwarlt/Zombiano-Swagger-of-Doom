using System;
using System.IO;

namespace server.picture
{
    public class get : RequestHandler
    {
        protected override void HandleRequest()
        {
            //Context.Response.Redirect("http://www.realmofthemadgod.com/picture/get?id=" + Query["id"]);
            string id = Query["id"];
            string instance = Query["instance"];

            byte[] status = System.Text.Encoding.UTF8.GetBytes("<Error>Bad Request</Error>");

            try
            {
                using (var db = new db.Database(Program.Settings.GetValue("conn")))
                {
                    var cmd = db.CreateQuery();

                    cmd.CommandText = "SELECT data, fileSize FROM sprites WHERE id=@id";
                    cmd.Parameters.AddWithValue("@id", Query["id"]);

                    using (var rdr = cmd.ExecuteReader())
                    {
                        if (!rdr.HasRows) return;
                        rdr.Read();

                        Context.Response.ContentType = "image/png";
                        var fileSize = rdr.GetInt32("fileSize");
                        var raw = new byte[fileSize];
                        long len = rdr.GetBytes(rdr.GetOrdinal("data"), 0, raw, 0, fileSize);
                        status = raw;
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            Context.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}
