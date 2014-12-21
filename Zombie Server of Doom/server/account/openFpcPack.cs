using db;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace server.account
{
    public class openFpcPack : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                Account acc;

                if ((acc = db.Verify(Query["guid"], Query["password"])) != null)
                {
                    var cmd = db.CreateQuery();
                    cmd.CommandText = "SELECT * FROM fpcpacks WHERE accId=@accId AND id=@id;";
                    cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                    cmd.Parameters.AddWithValue("@id", Query["packId"]);
                    var rdr = cmd.ExecuteReader();

                    if (rdr.HasRows)
                    {
                        rdr.Read();
                        addContentsToAccount(acc, rdr.GetString("contents"));
                        rdr.Close();

                        cmd = db.CreateQuery();
                        cmd.CommandText = "UPDATE fpcpacks SET used=1 WHERE accId=@accId AND id=@id;";
                        cmd.Parameters.AddWithValue("@accId", acc.AccountId);
                        cmd.Parameters.AddWithValue("@id", Query["packId"]);
                        cmd.ExecuteNonQuery();
                    }
                    else
                        WriteErrorLine("Pack not found");
                }
                else
                    WriteErrorLine("Account credentials not valid");
            }
        }

        private void addContentsToAccount(Account acc, string content)
        {
            //Todo: Implement da shizzle di dizzle
        }
    }
}
