using db;

namespace server.account
{
    public class setName : RequestHandler
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
                    cmd.CommandText = "SELECT COUNT(name) FROM accounts WHERE name=@name;";
                    cmd.Parameters.AddWithValue("@name", Query["name"]);
                    if ((int)(long)cmd.ExecuteScalar() > 0)
                        WriteErrorLine("Duplicated name");
                    else
                    {
                        cmd = db.CreateQuery();
                        cmd.CommandText = "UPDATE accounts SET name=@name, namechosen=TRUE WHERE id=@accId;";
                        cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                        cmd.Parameters.AddWithValue("@name", Query["name"]);
                        if (cmd.ExecuteNonQuery() > 0)
                            WriteLine("<Success />");
                        else
                            WriteErrorLine("Internal error");
                    }
                }
            }
        }
    }
}
