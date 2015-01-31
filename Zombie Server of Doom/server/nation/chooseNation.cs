using db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace server.nation
{
    internal class chooseNation : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue<string>("conn")))
            {
                Account acc;

                if ((acc = db.Verify(Query["guid"], Query["password"])) != null)
                {
                    var cmd = db.CreateQuery();
                    cmd.CommandText = "UPDATE accounts SET country=@nation WHERE id=@accId;";
                    cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    cmd.Parameters.AddWithValue("@nation", Query["nationId"]);
                    if (cmd.ExecuteNonQuery() > 0)
                        WriteLine("<Success><Nation>" + Query["nationId"] + "</Nation></Success>");
                    else
                        WriteErrorLine("Unknown Error: query result lesser or equal 0");
                }
                else WriteErrorLine("Account credentials not valid.");
            }
        }
    }
}
