using db;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Xml;
using System.Xml.Serialization;

namespace server.account
{
    class verify : IRequestHandler
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
                var acc = db.Verify(query["guid"], query["password"]);
                if (acc == null)
                {
                    var status = Encoding.UTF8.GetBytes("<Error>Bad login</Error>");
                    context.Response.OutputStream.Write(status, 0, status.Length);
                }
                else
                {
                    XmlSerializer serializer = new XmlSerializer(acc.GetType(), new XmlRootAttribute(acc.GetType().Name) { Namespace = "" });

                    XmlWriterSettings xws = new XmlWriterSettings();
                    xws.Indent = true;
                    xws.IndentChars = "    ";
                    xws.OmitXmlDeclaration = true;
                    xws.Encoding = Encoding.UTF8;
                    XmlWriter xtw = XmlWriter.Create(context.Response.OutputStream, xws);
                    serializer.Serialize(xtw, acc, acc.Namespaces);
                }
            }
        }
    }
}
