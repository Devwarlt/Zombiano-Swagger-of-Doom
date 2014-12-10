using db;
using db.utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace server.picture
{
    public class save : RequestHandler
    {
        private byte[] buff = new byte[0x10000];

        protected override bool ParseQueryString()
        {
            return false;
        }

        protected override void HandleRequest()
        {
            HttpMultipartParser parser = new HttpMultipartParser(Context.Request.InputStream, Encoding.UTF8, "data");
            
            if (parser.Success)
            {
                using (var db = new Database(Program.Settings.GetValue("conn")))
                {
                    Account acc = db.Verify(parser.Parameters["guid"], parser.Parameters["password"]);
                    var cmd = db.CreateQuery();
                    var guid = parser.Parameters["guid"];
                    if (guid == "Admin" && !acc.Admin)
                        guid = "Guest";
                    if (parser.Parameters["admin"] == "true" && acc.Admin)
                        guid = "Admin";

                    cmd.CommandText = "INSERT INTO sprites(guid, name, dataType, tags, data, fileSize) VALUES(@guid, @name, @dataType, @tags, @data, @fileSize)";
                    cmd.Parameters.AddWithValue("@guid", guid);
                    cmd.Parameters.AddWithValue("@name", parser.Parameters["name"]);
                    cmd.Parameters.AddWithValue("@dataType", parser.Parameters["datatype"]);
                    cmd.Parameters.AddWithValue("@tags", parser.Parameters["tags"].Replace(", ", ",").Replace(" ,", ",").Trim());
                    cmd.Parameters.AddWithValue("@data", parser.FileContents);
                    cmd.Parameters.AddWithValue("@fileSize", parser.FileContents.Length);

                    try
                    {
                        if (cmd.ExecuteNonQuery() > 0) WriteLine("<Success/>");
                        else WriteErrorLine("Account credentials not valid");
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e);
                    }
                }
            }
        }
    }
}
