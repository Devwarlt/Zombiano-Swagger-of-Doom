using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace server.credits
{
    public class getInfo : RequestHandler
    {
        private static string creditsXml;

        protected override void HandleRequest()
        {
            if(creditsXml == null) creditsXml = System.IO.File.ReadAllText("credits.xml");
            WriteLine(creditsXml);
        }
    }
}
