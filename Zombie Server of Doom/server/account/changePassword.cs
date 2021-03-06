﻿using db;

namespace server.account
{
    public class changePassword : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                var acc = db.Verify(Query["guid"], Query["password"]);
                if (acc == null)
                    WriteErrorLine("Bad login");
                else
                {
                    var cmd = db.CreateQuery();
                    cmd.CommandText = "UPDATE accounts SET password=SHA1(@password) WHERE id=@accId;";
                    cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    cmd.Parameters.AddWithValue("@password", Query["newPassword"]);
                    if (cmd.ExecuteNonQuery() > 0)
                        WriteLine("<Success />");
                    else
                        WriteErrorLine("Internal error");
                }
            }
        }
    }
}
