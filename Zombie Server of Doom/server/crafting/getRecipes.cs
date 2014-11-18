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
    internal class getRecipes : IRequestHandler
    {
        public void HandleRequest(HttpListenerContext context)
        {
            NameValueCollection query;
            using (StreamReader rdr = new StreamReader(context.Request.InputStream))
                query = HttpUtility.ParseQueryString(rdr.ReadToEnd());

            if (query.AllKeys.Length == 0)
            {
                string currurl = context.Request.RawUrl;
                int iqs = currurl.IndexOf('?');
                if (iqs >= 0)
                {
                    query = HttpUtility.ParseQueryString((iqs < currurl.Length - 1) ? currurl.Substring(iqs + 1) : string.Empty);
                }
            }

            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                string recipes = String.Empty;
                var cmd = db.CreateQuery();
                cmd.CommandText = "Select * FROM craftingrecipes";
                using (var rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        recipes += rdr.GetString("row1") + "," + rdr.GetString("row2") + "," + rdr.GetString("row3") + ";" + rdr.GetString("result") + "\n";
                    }
                }
                using (StreamWriter wtr = new StreamWriter(context.Response.OutputStream))
                {
                    wtr.Write(recipes.Remove(recipes.LastIndexOf('\n')));
                }
            }
        }
    }
}
