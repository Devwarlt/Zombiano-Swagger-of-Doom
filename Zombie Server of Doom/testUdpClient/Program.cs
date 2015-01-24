using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace testUdpClient
{
    class Program
    {
        static void Main(string[] args)
        {
            Socket sock = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);

            IPAddress serverAddr = IPAddress.Parse("127.0.0.1");

            IPEndPoint endPoint = new IPEndPoint(serverAddr, 2050);

            string text = "Hello";
            byte[] send_buffer = Encoding.ASCII.GetBytes(text);

            sock.SendTo(send_buffer, endPoint);

            byte[] buff = new byte[1];

            sock.Receive(buff);
            Console.WriteLine(buff[0]);
            Console.ReadLine();
        }
    }
}
