using System.Net;
using System.Text;

namespace server.account
{
    class forgotPassword : IRequestHandler
    {
        public void HandleRequest(HttpListenerContext context)
        {
            byte[] status = Encoding.UTF8.GetBytes("<Error>Not yet implemented.</Error>");
            context.Response.OutputStream.Write(status, 0, status.Length);
        }
    }
}
