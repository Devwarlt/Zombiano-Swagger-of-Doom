using db;
using log4net;
using log4net.Config;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Net;
using System.Threading;

namespace server
{
    class Program
    {
        static HttpListener listener;
        static readonly Thread[] workers = new Thread[25];
        static readonly Queue<HttpListenerContext> contextQueue = new Queue<HttpListenerContext>();
        static readonly object queueLock = new object();
        static readonly ManualResetEvent queueReady = new ManualResetEvent(false);

        internal static SimpleSettings Settings;
        internal static XmlData GameData;

        static ILog log = LogManager.GetLogger("Server");

        static void Main(string[] args)
        {
            XmlConfigurator.ConfigureAndWatch(new FileInfo("log4net.config"));

            Thread.CurrentThread.CurrentCulture = CultureInfo.InvariantCulture;
            Thread.CurrentThread.Name = "Entry";

            using (Settings = new SimpleSettings("server"))
            {
                GameData = new XmlData();
                int port = Settings.GetValue<int>("port", "80");

                listener = new HttpListener();
                listener.Prefixes.Add("http://*:" + port + "/");
                listener.Start();

                listener.BeginGetContext(ListenerCallback, null);
                for (var i = 0; i < workers.Length; i++)
                {
                    workers[i] = new Thread(Worker) { Name = "Worker " + i };
                    workers[i].Start();
                }
                Console.CancelKeyPress += (sender, e) => e.Cancel = true;
                log.Info("Listening at port " + port + "...");

                while (Console.ReadKey(true).Key != ConsoleKey.Escape) ;

                log.Info("Terminating...");
                terminating = true;
                listener.Stop();
                queueReady.Set();
                GameData.Dispose();
                while (contextQueue.Count > 0)
                    Thread.Sleep(100);
            }
        }

        static void ListenerCallback(IAsyncResult ar)
        {
            if (!listener.IsListening) return;
            var context = listener.EndGetContext(ar);
            listener.BeginGetContext(ListenerCallback, null);
            lock (queueLock)
            {
                contextQueue.Enqueue(context);
                queueReady.Set();
            }
        }

        static bool terminating = false;
        static void Worker()
        {
            while (queueReady.WaitOne())
            {
                if (terminating) return;
                HttpListenerContext context;
                lock (queueLock)
                {
                    if (contextQueue.Count > 0)
                        context = contextQueue.Dequeue();
                    else
                    {
                        queueReady.Reset();
                        continue;
                    }
                }

                try
                {
                    ProcessRequest(context);
                }
                catch { }
            }
        }

        static void ProcessRequest(HttpListenerContext context)
        {
            try
            {
                if (context.Request.UserAgent != "GameClient")
                {
                    using (StreamWriter wtr = new StreamWriter(context.Response.OutputStream))
                        wtr.Write("<h1>Requests from non clients are disabled in debugging mode</h1>");
                    context.Response.Close();
                    return;
                }
                log.InfoFormat("Dispatching request '{0}'@{1}",
                    context.Request.Url.LocalPath, context.Request.RemoteEndPoint);

                if (context.Request.Url.LocalPath.Contains("sfx") || context.Request.Url.LocalPath.Contains("music"))
                {
                    //To load the sound effects c:
                    sfx.sfx sound = new sfx.sfx();
                    sound.HandleRequest(context);
                    context.Response.Close();
                    return;
                }

                Object handler;
                Type t;
                string s;
                if(context.Request.Url.LocalPath.IndexOf(".") == -1)
                    s = "server" + context.Request.Url.LocalPath.Replace("/", ".");
                else
                    s = "server" + context.Request.Url.LocalPath.Remove(context.Request.Url.LocalPath.IndexOf(".")).Replace("/", ".");
                if ((t = Type.GetType(s)) == null)
                {
                    using (StreamWriter wtr = new StreamWriter(context.Response.OutputStream))
                        wtr.Write("<Error>Class \"{0}\" not found.</Error>", s);
                }

                //if (!RequestHandlers.Handlers.TryGetValue(context.Request.Url.LocalPath, out handler))
                //{
                //    using (StreamWriter wtr = new StreamWriter(context.Response.OutputStream))
                //        wtr.Write("<Error>Bad request</Error>");
                //}
                else
                {
                    handler = Activator.CreateInstance(t, null, null);
                    if (!(handler is RequestHandler))
                    {
                        if(handler == null)
                            using (StreamWriter wtr = new StreamWriter(context.Response.OutputStream))
                                wtr.Write("<Error>Class \"{0}\" not found.</Error>", t.FullName);
                        else
                            using (StreamWriter wtr = new StreamWriter(context.Response.OutputStream))
                                wtr.Write("<Error>Class \"{0}\" is not of the type RequestHandler.</Error>", t.FullName);
                    }
                    else
                        (handler as RequestHandler).HandleRequest(context);
                        
                }
            }
            catch (Exception e)
            {
                using (StreamWriter wtr = new StreamWriter(context.Response.OutputStream))
                    wtr.Write("<Error>Internal Server Error</Error>");
                log.Error("Error when dispatching request", e);
            }

            context.Response.Close();
        }
    }
}
