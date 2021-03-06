﻿using db;

namespace server.@char
{
    public class delete : RequestHandler
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
                    cmd.CommandText = @"DELETE FROM characters WHERE accId = @accId AND charId = @charId;";
                    cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    cmd.Parameters.AddWithValue("@charId", Query["charId"]);
                    if (cmd.ExecuteNonQuery() > 0)
                        WriteLine("<Success />");
                    else
                        WriteErrorLine("Internal Error");
                }
            }
        }
    }
}
