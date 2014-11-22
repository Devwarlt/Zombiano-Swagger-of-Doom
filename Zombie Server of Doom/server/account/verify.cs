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
using System.Xml.Serialization;
using System.Xml;

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
                else
                {
                    XmlSerializer serializer = new XmlSerializer(acc.GetType(), new XmlRootAttribute(acc.GetType().Name) { Namespace = "" });

                    XmlWriterSettings xws = new XmlWriterSettings();
                    xws.OmitXmlDeclaration = true;
                    xws.Encoding = Encoding.UTF8;
                    XmlWriter xtw = XmlWriter.Create(Context.Response.OutputStream, xws);
                    serializer.Serialize(xtw, acc, acc.Namespaces);
                }
            }
        }
    }
}
