using db;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace server.crafting
{
    public class getRecipes : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                Account acc = db.Verify(Query["guid"], Query["password"]);

                if (acc != null)
                {
                    string recipes = String.Empty;
                    foreach (var i in acc.CraftingRecipes)
                    {
                        var cmd = db.CreateQuery();
                        cmd.CommandText = "Select * FROM craftingrecipes WHERE id=@id;";
                        cmd.Parameters.AddWithValue("@id", i);

                        using (var rdr = cmd.ExecuteReader())
                        {
                            if (!rdr.HasRows) continue;
                            rdr.Read();
                            recipes += rdr.GetString("row1") + "," + rdr.GetString("row2") + "," + rdr.GetString("row3") + ";" + rdr.GetString("result") + "\n";
                        }
                    }

                    using (StreamWriter wtr = new StreamWriter(Context.Response.OutputStream))
                        wtr.Write(recipes.Remove(recipes.LastIndexOf('\n')));
                }
                else
                    WriteErrorLine("Account credentials not valid");
            }
        }
    }
}
