using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Collections.Specialized;
using System.IO;
using System.Web;

namespace server.picture
{
    public class get : RequestHandler
    {
        byte[] buff = new byte[0x10000];
        protected override void HandleRequest()
        {
            //warning: maybe has hidden url injection
            string id = Query["id"];
            foreach (var i in id)
            {
                if (char.IsLetter(i) || i == '_' || i == '-') continue;

                WriteErrorLine("Invalid ID.");
                return;
            }

            string path = Path.GetFullPath("texture/_" + id + ".png");
            if (!File.Exists(path))
            {
                WriteErrorLine("Invalid ID.");
                return;
            }

            Context.Response.ContentType = "image/png";
            using (var i = File.OpenRead(path))
            {
                int c;
                while ((c = i.Read(buff, 0, buff.Length)) > 0)
                    Context.Response.OutputStream.Write(buff, 0, c);
            }
        }
    }
}
