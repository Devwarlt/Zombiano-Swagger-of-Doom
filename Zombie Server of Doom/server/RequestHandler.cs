using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Collections.Specialized;
using System.IO;
using System.Web;

namespace server
{
    public abstract class RequestHandler
    {
        protected NameValueCollection Query { get; private set; }
        protected HttpListenerContext Context { get; private set; }

        public void HandleRequest(HttpListenerContext context)
        {
            Context = context;
            Query = new NameValueCollection();
            using (StreamReader rdr = new StreamReader(context.Request.InputStream))
                Query = HttpUtility.ParseQueryString(rdr.ReadToEnd());

            if (Query.AllKeys.Length == 0)
            {
                string currurl = context.Request.RawUrl;
                int iqs = currurl.IndexOf('?');
                if (iqs >= 0)
                {
                    Query = HttpUtility.ParseQueryString((iqs < currurl.Length - 1) ? currurl.Substring(iqs + 1) : string.Empty);
                }
            }

            HandleRequest();
        }

        public void WriteLine(string value, params object[] args)
        {
            using (StreamWriter wtr = new StreamWriter(Context.Response.OutputStream))
                wtr.WriteLine(value, args);
        }

        public void WriteErrorLine(string value, params object[] args)
        {
            using (StreamWriter wtr = new StreamWriter(Context.Response.OutputStream))
                wtr.WriteLine("<Error>" + value + "</Error>", args);
        }

        protected abstract void HandleRequest();
    }

    static class RequestHandlers
    {
        public static readonly Dictionary<string, RequestHandler> Handlers = new Dictionary<string, RequestHandler>()
        {
            { "/crossdomain.xml", new crossdomain() },
            { "/char/list", new @char.list() },
            { "/char/delete", new @char.delete() },
            { "/char/fame", new @char.fame() },
            { "/account/register", new account.register() },
            { "/account/verify", new account.verify() },
            { "/account/forgotPassword", new account.forgotPassword() },
            { "/account/sendVerifyEmail", new account.sendVerifyEmail() },
            { "/account/changePassword", new account.changePassword() },
            { "/account/purchaseCharSlot", new account.purchaseCharSlot() },
            { "/account/setName", new account.setName() },
            { "/credits/getoffers", new credits.getoffers() },
            { "/credits/add", new credits.add() },
            { "/crafting/getRecipes", new crafting.getRecipes() },
            { "/fame/list", new fame.list() },
            { "/picture/get", new picture.get() },
        };
    }
}
