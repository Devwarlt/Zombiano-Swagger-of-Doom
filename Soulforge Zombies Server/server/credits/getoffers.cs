using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;

namespace server.credits
{
    class getoffers : IRequestHandler
    {
        public void HandleRequest(HttpListenerContext context)
        {
            var res = Encoding.UTF8.GetBytes(
"<Offers><Tok></Tok><Exp></Exp><Offer><Id>0</Id><Price>5</Price><RealmGold>21</RealmGold><CheckoutJWT></CheckoutJWT><Data></Data><Currency>USD</Currency></Offer></Offers>");
            context.Response.OutputStream.Write(res, 0, res.Length);
        }
    }
}