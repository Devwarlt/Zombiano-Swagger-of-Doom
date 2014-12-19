using db;
using System.Text.RegularExpressions;

namespace server.account
{
    public class setName : RequestHandler
    {
        private static bool IsUsername(string username)
        {
            string pattern;
            // start with a letter, allow letter or number, length between 3 to 12.
            pattern = @"^[a-zA-Z0-9]{3,12}$";

            var regex = new Regex(pattern);
            return regex.IsMatch(username);
        }

        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                var acc = db.Verify(Query["guid"], Query["password"]);
                if (acc == null)
                    WriteErrorLine("Bad login");
                else
                {
                    if (acc.NameChosen)
                    {
                        var cmd = db.CreateQuery();
                        cmd.CommandText = "SELECT COUNT(name) FROM accounts WHERE name=@name;";
                        cmd.Parameters.AddWithValue("@name", Query["name"]);
                        if ((int)(long)cmd.ExecuteScalar() > 0)
                            WriteErrorLine("Duplicated name");
                        else
                        {
                            if (IsUsername(Query["name"]))
                            {
                                cmd = db.CreateQuery();
                                cmd.CommandText = "UPDATE accounts SET name=@name, namechosen=TRUE WHERE id=@accId;";
                                cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                                cmd.Parameters.AddWithValue("@name", Query["name"]);
                                if (cmd.ExecuteNonQuery() > 0)
                                    WriteLine("<Success />");
                                else
                                    WriteErrorLine("Database error");
                            }
                            else
                                WriteErrorLine("Invalid name");
                        }
                    }
                    else
                        WriteErrorLine("You have already a name");
                }
            }
        }
    }
}
