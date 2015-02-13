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
}
