using db;
using System;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace server.account
{
    public class verify : RequestHandler
    {
        protected override void HandleRequest()
        {
            using (var db = new Database(Program.Settings.GetValue("conn")))
            {
                var acc = db.Verify(Query["guid"], Query["password"]);
                if (acc == null)
                    WriteErrorLine("Bad login");
                else if (!String.IsNullOrWhiteSpace(acc.BanReason)) WriteErrorLine("AC.BAN{0}", acc.BanReason);
                else
                {
                    XmlSerializer serializer = new XmlSerializer(acc.GetType(), new XmlRootAttribute(acc.GetType().Name) { Namespace = "" });

                    XmlWriterSettings xws = new XmlWriterSettings();
                    xws.Indent = true;
                    xws.IndentChars = "    ";
                    xws.OmitXmlDeclaration = true;
                    xws.Encoding = Encoding.UTF8;
                    XmlWriter xtw = XmlWriter.Create(Context.Response.OutputStream, xws);
                    serializer.Serialize(xtw, acc, acc.Namespaces);
                }
            }
        }
    }
}
