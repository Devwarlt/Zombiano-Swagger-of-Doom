
namespace server.credits
{
    public class getoffers : RequestHandler
    {
        protected override void HandleRequest()
        {
            WriteLine(
@"<Offers>
    <Tok></Tok>
    <Exp></Exp>
    <Offer>
        <Id>0</Id>
        <Price>5</Price>
        <RealmGold>21</RealmGold>
        <CheckoutJWT></CheckoutJWT>
        <Data></Data>
        <Currency>USD</Currency>
    </Offer>
    <Offer>
        <Id>1</Id>
        <Price>100</Price>
        <RealmGold>100000</RealmGold>
        <CheckoutJWT></CheckoutJWT>
        <Data></Data>
        <Currency>USD</Currency>
    </Offer>
</Offers>");
        }
    }
}