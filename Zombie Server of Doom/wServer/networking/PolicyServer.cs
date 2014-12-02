﻿using log4net;
using System;
using System.Net;
using System.Net.Sockets;

namespace wServer.networking
{
    class PolicyServer
    {
        static ILog log = LogManager.GetLogger(typeof(PolicyServer));

        TcpListener listener;
        public PolicyServer()
        {
            listener = new TcpListener(IPAddress.Any, 843);
        }

        static void ServePolicyFile(IAsyncResult ar)
        {
            try
            {
                TcpClient cli = (ar.AsyncState as TcpListener).EndAcceptTcpClient(ar);
                (ar.AsyncState as TcpListener).BeginAcceptTcpClient(ServePolicyFile, ar.AsyncState);

                var s = cli.GetStream();
                NReader rdr = new NReader(s);
                NWriter wtr = new NWriter(s);
                if (rdr.ReadNullTerminatedString() == "<policy-file-request/>")
                {
                    wtr.WriteNullTerminatedString(@"<cross-domain-policy>
     <allow-access-from domain=""*"" to-ports=""*"" />
</cross-domain-policy>");
                    wtr.Write((byte)'\r');
                    wtr.Write((byte)'\n');
                }
                cli.Close();
            }
            catch { }
        }

        bool started = false;
        public void Start()
        {
            log.Info("Starting policy server...");
            try
            {
                listener.Start();
                listener.BeginAcceptTcpClient(ServePolicyFile, listener);
                started = true;
            }
            catch
            {
                log.Warn("Could not start Socket Policy Server, is port 843 occupied?");
                started = false;
            }
        }

        public void Stop()
        {
            if (started)
            {
                log.Warn("Stopping policy server...");
                listener.Stop();
            }
        }
    }
}
