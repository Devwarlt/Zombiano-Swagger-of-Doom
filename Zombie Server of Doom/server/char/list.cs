using db;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace server.@char
{
    public class list : RequestHandler
    {
        Lazy<List<ServerItem>> svrList;
        public list()
        {
            svrList = new Lazy<List<ServerItem>>(GetServerList, true);
        }
        List<ServerItem> GetServerList()
        {
            var ret = new List<ServerItem>();
            int num = Program.Settings.GetValue<int>("svrNum");
            for (int i = 0; i < num; i++)
                ret.Add(new ServerItem()
                {
                    Name = Program.Settings.GetValue("svr" + i + "Name"),
                    Lat = Program.Settings.GetValue<int>("svr" + i + "Lat", "0"),
                    Long = Program.Settings.GetValue<int>("svr" + i + "Long", "0"),
                    DNS = Program.Settings.GetValue("svr" + i + "Adr", "127.0.0.1"),
                    Usage = 0.2,
                    IsUDP = Program.Settings.GetValue<bool>("svr" + i + "UDP", "false"),
                    AdminOnly = Program.Settings.GetValue<bool>("svr" + i + "Admin", "false")
                });
            return ret;
        }

        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {

                Chars chrs = new Chars()
                {
                    Characters = new List<Char>() { },
                    NextCharId = 2,
                    MaxNumChars = 1,
                    ServerVersion = Program.Settings.GetValue<string>("svrVersion"),
                    Account = db.Verify(Query["guid"], Query["password"]),
                    Servers = GetServerList()
                };
                if (chrs.Account != null)
                {
                    if (!String.IsNullOrWhiteSpace(chrs.Account.BanReason))
                    {
                        WriteErrorLine("AC.BAN{0}", chrs.Account.BanReason);
                        return;
                    }
                    db.GetCharData(chrs.Account, chrs);
                    db.LoadCharacters(chrs.Account, chrs);
                    chrs.News = db.GetNews(Program.GameData, chrs.Account);
                }
                else
                {
                    chrs.Account = Database.CreateGuestAccount(Query["guid"]);
                    chrs.News = db.GetNews(Program.GameData, null);
                }

                MemoryStream ms = new MemoryStream();
                XmlSerializer serializer = new XmlSerializer(chrs.GetType(), new XmlRootAttribute(chrs.GetType().Name) { Namespace = "" });

                XmlWriterSettings xws = new XmlWriterSettings();
                //xws.Indent = true;
                //xws.IndentChars = "    ";
                xws.OmitXmlDeclaration = true;
                xws.Encoding = Encoding.UTF8;
                XmlWriter xtw = XmlWriter.Create(Context.Response.OutputStream, xws);
                serializer.Serialize(xtw, chrs, chrs.Namespaces);
            }
        }
    }
}
