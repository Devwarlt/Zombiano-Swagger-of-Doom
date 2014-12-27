using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Net;
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
            if (ParseQueryString())
            {
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

        protected virtual bool ParseQueryString()
        {
            return true;
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
            { "/account/openFpcPack", new account.openFpcPack() },
            { "/account/purchasePremium", new account.purchasePremium() },
            { "/credits/getoffers", new credits.getoffers() },
            { "/credits/add", new credits.add() },
            { "/crafting/getRecipes", new crafting.getRecipes() },
            { "/fame/list", new fame.list() },
            { "/picture/get", new picture.get() },
            { "/picture/list", new picture.list() },
            { "/picture/save", new picture.save() },
            { "/picture/delete", new picture.delete() },
            { "/credits/getInfo", new credits.getInfo() }
        };
    }
}
