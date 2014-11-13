using System.Net;
using System.Text;

namespace server.account
{
    class sendVerifyEmail : IRequestHandler
    {
        public void HandleRequest(HttpListenerContext context)
        {
            byte[] status = Encoding.UTF8.GetBytes("<Error>Not yet implemented.</Error>");
            context.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}
