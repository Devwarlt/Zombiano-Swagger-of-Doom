using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer
{
    public interface IServer
    {
        void Start();
        void Stop();
        void SendPacket(UdpPacket pkt, Action onCompleted);
    }

    public abstract class Server : IServer
    {
        public const string BUILD_VERSION = "Indev 0.0.0";

        public abstract void Start();
        public abstract void Stop();
        public abstract void SendPacket(UdpPacket pkt, Action onCompleted);
    }
}
