using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace server.app
{
    public class getLanguageStrings : RequestHandler
    {
        private static readonly string EN = File.ReadAllText("app/language/en.xml");

        protected override void HandleRequest()
        {
            WriteLine(EN);
        }
    }
}
