using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace server.app
{
    public class getLanguageStrings : RequestHandler
    {
        protected override void HandleRequest()
        {
            WriteLine(
@"<Language type=""de"">
    <buy.Text>Kaufen für </buy.Text>
</Language>");
        }
    }
}
