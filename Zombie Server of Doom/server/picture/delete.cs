using System;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using db;
using MySql.Data.MySqlClient;

namespace server.picture
{
    internal class delete : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                Account acc;

                if((acc = db.Verify(Query["guid"], Query["password"])) != null)
                {
                    if (acc.Admin)
                    {
                        var cmd = db.CreateQuery();
                        cmd = db.CreateQuery();
                        cmd.CommandText = "DELETE FROM sprites WHERE id=@id LIMIT 1";
                        cmd.Parameters.AddWithValue("@id", Query["id"]);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            WriteLine("<Success/>");
                            return;
                        }
                    }
                }

                WriteErrorLine("You can't delete this sprite");
            }
        }
    }
}