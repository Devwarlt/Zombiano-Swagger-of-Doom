using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;

namespace server.credits
{
    public class getoffers : RequestHandler
    {
        protected override void HandleRequest()
        {
            WriteLine(
"<Offers><Tok></Tok><Exp></Exp><Offer><Id>0</Id><Price>5</Price><RealmGold>21</RealmGold><CheckoutJWT></CheckoutJWT><Data></Data><Currency>USD</Currency></Offer></Offers>");
        }
    }
}