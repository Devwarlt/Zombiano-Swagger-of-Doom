using db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace server.account
{
    public class purchasePremium : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue<string>("conn")))
            {
                Account acc;
                if ((acc = db.Verify(Query["guid"], Query["password"])) != null)
                {
                    var cmd = db.CreateQuery();
                    cmd.CommandText = "UPDATE accounts SET premium=1 WHERE id=@accId";
                    cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    cmd.ExecuteNonQuery();
                    WriteLine("<Success />");
                }
                else
                    WriteErrorLine("Account credentials not valid");
            }
        }
    }
}
