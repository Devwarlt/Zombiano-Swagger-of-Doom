using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace server.town
{
    internal class getShopOffers : RequestHandler
    {
        protected override void HandleRequest()
        {
            //WriteErrorLine("Village not found.");
            WriteLine(
@"<TownShop>
  <Offers>
    <Offer id=""0"" price=""1000"" currency=""0"" image=""house"" offerTitle=""House"" description=""This house increases the capacity from your maximum population by 32."" />
    <Offer id=""1"" price=""500"" currency=""1"" image=""house"" offerTitle=""House"" description=""This house increases the capacity from your maximum population by 16."" />
    <Offer id=""2"" price=""100"" currency=""2"" image=""house"" offerTitle=""House"" description=""This house increases the capacity from your maximum population by 8."" />
    <Offer id=""3"" price=""5000"" currency=""0"" image=""tradingPost"" offerTitle=""Trading Post"" description=""This makes your village merchantable\nClick for more information..."" />
  </Offers>
</TownShop>");
        }
    }
}
