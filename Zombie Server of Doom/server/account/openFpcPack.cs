using db;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Xml.Linq;
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
                        var contents = rdr.GetString("contents");
                        rdr.Close();
                        addContentsToAccount(acc, db, Utils.FromCommaSepString32(contents));

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

        private void addContentsToAccount(Account acc, Database db, int[] contents)
        {
            XElement xml;
            foreach (var itemId in contents)
            {
                if (Program.GameData.Xmls.TryGetValue((ushort)itemId, out xml))
                {
                    switch (xml.Element("Class").Value)
                    {
                        case "Skin":
                            acc.OwnedSkins.Add(itemId);
                            break;
                        case "Equipment":
                        case "Dye":
                            acc.Gifts.Add(itemId);
                            break;
                    }
                }
            }

            db.SaveAccount(acc);
        }
    }
}
