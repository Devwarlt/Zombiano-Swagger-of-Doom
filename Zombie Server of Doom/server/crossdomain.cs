using System.Text;

namespace server
{
    public class crossdomain : RequestHandler
    {
        protected override void HandleRequest()
        {
            byte[] status = Encoding.UTF8.GetBytes(
@"<cross-domain-policy>
<allow-access-from domain=""*""/>
</cross-domain-policy>");
            Context.Response.ContentType = "text/x-cross-domain-policy";
            Context.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}
