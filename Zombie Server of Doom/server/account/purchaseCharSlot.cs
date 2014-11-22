using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using db;
using System.Collections.Specialized;
using System.IO;
using System.Web;
using System.Text.RegularExpressions;
using System.Xml.Serialization;
using System.Xml;

namespace server.account
{
    public class purchaseCharSlot : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                var acc = db.Verify(Query["guid"], Query["password"]);
                if (acc == null)
                {
                    WriteErrorLine("Bad login");
                }
                else
                {
                    var cmd = db.CreateQuery();
                    cmd.CommandText = "SELECT credits FROM stats WHERE accId=@accId;";
                    cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    if ((int)cmd.ExecuteScalar() < 100)
                        WriteErrorLine("Not enough credits");
                    else
                    {
                        cmd = db.CreateQuery();
                        cmd.CommandText = "UPDATE stats SET credits = credits - 100 WHERE accId=@accId";
                        cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                        if ((int)cmd.ExecuteNonQuery() > 0)
                        {
                            cmd = db.CreateQuery();
                            cmd.CommandText = "UPDATE accounts SET maxCharSlot = maxCharSlot + 1 WHERE id=@accId";
                            cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                            if ((int)cmd.ExecuteNonQuery() > 0)
                                WriteLine("<Success/>");
                            else
                                WriteErrorLine("Internal Error");
                        }
                        else
                            WriteErrorLine("Internal Error");
                    }
                }
            }
        }
    }
}
