using db;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Xml;
using System.Xml.Serialization;

namespace server.picture
{
    internal class list : RequestHandler
    {
        private byte[] buff = new byte[0x10000];

        protected override void HandleRequest()
        {
            //Context.Response.Redirect("http://www.realmofthemadgod.com/picture/list?num=24&myGUID=ossimc&tags=fpc");
            Pics pics = new Pics();
            pics.Offset = Query["offset"] != null ? Convert.ToInt32(Query["offset"]) : 0;
            pics.Pictures = new List<Pic>();
            int count = 0;
            using(var db = new Database(Program.Settings.GetValue("conn")))
            {
                var cmd = db.CreateQuery();

                cmd.CommandText = "SELECT COUNT(id) FROM sprites";
                count = ((int) (long) cmd.ExecuteScalar());

                cmd = db.CreateQuery();
                cmd.CommandText = "SELECT * FROM sprites";

                using (MySqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        int id = rdr.GetInt32("id");
                        string guid = rdr.GetString("guid");
                        string name = rdr.GetString("name");
                        int dataType = rdr.GetInt32("dataType");
                        string[] tags = rdr.GetString("tags").Split(',');

                        string data;

                        var fileSize = rdr.GetInt32("fileSize");
                        var raw = new byte[fileSize];
                        long len = rdr.GetBytes(rdr.GetOrdinal("data"), 0, raw, 0, fileSize);
                        data = Convert.ToBase64String(raw);

                        if (Query["tags"] != null) 
                        {
                            List<string> tagList = new List<string>(tags);
                            bool succeded = true;
                            foreach (var i in Query["tags"].Trim().Split(','))
                            {
                                if (!tagList.Contains(i.Trim()))
                                    succeded = false;
                            }
                            if (!succeded)
                                continue;
                        }
                        if (Query["dataType"] != null && Convert.ToInt32(Query["dataType"]) != dataType)
                            continue;
                        if (Query["guid"] != null)
                        {
                            //if (query["guid"] == "Admin")
                            //    continue;

                            if (Query["guid"] != guid)
                                continue;
                        }

                        var pic = new Pic
                        {
                            Id = id,
                            DataType = dataType,
                            PicName = name,
                            Tags = string.Join(",", tags),
                            Data = data
                        };
                        if (Query["myGUID"] == guid)
                        {
                            pic.Mine = "";
                        }
                        pics.Pictures.Add(pic);
                    }
                }
            }

            int num = 0;
            if (Query["offset"] != null)
                pics.Pictures.RemoveRange(0, (Convert.ToInt32(Query["offset"]) > count) ? count : Convert.ToInt32(Query["offset"]));
            if (Query["num"] != null)
                if ((num = Convert.ToInt32(Query["num"])) < count)
                    if(pics.Pictures.Count - 1 > num)
                        pics.Pictures.RemoveRange(num, count - num);

            var ms = new MemoryStream();
            var serializer = new XmlSerializer(pics.GetType(),
                new XmlRootAttribute(pics.GetType().Name) { Namespace = "" });

            var xws = new XmlWriterSettings();
            xws.OmitXmlDeclaration = true;
            xws.Encoding = Encoding.UTF8;
            xws.Indent = true;
            XmlWriter xtw = XmlWriter.Create(Context.Response.OutputStream, xws);
            serializer.Serialize(xtw, pics, pics.Namespaces);
        }
    }
}