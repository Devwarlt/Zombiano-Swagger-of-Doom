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
using System.Globalization;

namespace server.account
{
    public class register : RequestHandler
    {
        private static bool IsUsername(string username)
        {
            string pattern;
            // start with a letter, allow letter or number, length between 6 to 12.
            pattern = @"^[a-zA-Z][a-zA-Z]{3,20}$";

            var regex = new Regex(pattern);
            return regex.IsMatch(username);
        }

        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                if (!IsUsername(Query["newGUID"]))
                    WriteErrorLine("Invalid username");
                else
                {
                    if (db.HasUuid(Query["guid"]) &&
                        db.Verify(Query["guid"], "") != null)
                    {
                        if (db.HasUuid(Query["newGUID"]))
                            WriteErrorLine("Duplicate username");
                        else if (db.HasEmail(Query["email"]))
                            WriteErrorLine("Duplicate email");
                        else
                        {
                            var cmd = db.CreateQuery();
                            cmd.CommandText =
                                "UPDATE accounts SET uuid=@newUuid, password=SHA1(@password), email=@email, guest=FALSE WHERE uuid=@uuid;";
                            cmd.Parameters.AddWithValue("@uuid", Query["guid"]);
                            cmd.Parameters.AddWithValue("@newUuid", Query["newGUID"]);
                            cmd.Parameters.AddWithValue("@password", Query["newPassword"]);
                            cmd.Parameters.AddWithValue("@email", Query["email"]);
                            if (cmd.ExecuteNonQuery() > 0)
                                WriteLine("<Success />");
                            else
                                WriteErrorLine("Internal Error");
                        }
                    }
                    else
                    {
                        if (db.HasUuid(Query["newGUID"]))
                            WriteErrorLine("Duplicate username");
                        else if (db.HasEmail(Query["email"]))
                            WriteErrorLine("Duplicate email");
                        else
                        {
                            if (db.Register(Query["newGUID"], Query["newPassword"], Query["email"], false) != null)
                                WriteLine("<Success />");
                            else
                                WriteErrorLine("Internal Error");
                        }
                    }
                }
            }
        }
    }
}
