using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace server.town
{
    public class getGeneralInfo : RequestHandler
    {
        protected override void HandleRequest()
        {
            WriteLine(@"<Town><Houses current=""10"" max=""20"" /><Shop upgrade=""0"" /></Town>");
        }
    }
}
