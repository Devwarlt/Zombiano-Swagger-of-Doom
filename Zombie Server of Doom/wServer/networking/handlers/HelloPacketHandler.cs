using System;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;

namespace wServer.networking.handlers
{
    class HelloPacketHandler : PacketHandlerBase<HelloPacket>
    {
        public override PacketID ID { get { return PacketID.Hello; } }

        protected override void HandlePacket(Client client, HelloPacket packet)
        {
            if (packet.BuildVersion != Server.BUILD_VERSION)
            {
                SendFailure(Server.BUILD_VERSION, 4);
                return;
            }

            Account acc = client.Manager.Database.Verify(packet.GUID, packet.Password);
            if (acc == null)
            {
                SendFailure("No guest accounts pl0x");
                //acc = client.Manager.Database.Register(packet.GUID, packet.Password, true);
                //if (acc == null)
                //{
                //    SendFailure(client, "Invalid account.");
                //    client.Disconnect();
                //    return;
                //}
            }

            client.Account = acc;
            if (!client.Manager.TryConnect(client))
            {
                client.Account = null;
                SendFailure("Failed to connect.");
                client.Disconnect();
            }
            else
            {
                World world = client.Manager.GetWorld(packet.GameId);
                if (world == null)
                {
                    SendFailure("Invalid world.");
                    client.Disconnect();
                }
                else
                {
                    if (world.Id == -6) //Test World
                        (world as realm.worlds.Test).LoadJson(packet.MapInfo);
                    else if (world.IsLimbo)
                        world = world.GetInstance(client);

                    var seed = (uint)((long)Environment.TickCount * packet.GUID.GetHashCode()) % uint.MaxValue;
                    client.Random = new wRandom(seed);
                    client.targetWorld = world.Id;
                    client.SendPacket(new MapInfoPacket()
                    {
                        Width = world.Map.Width,
                        Height = world.Map.Height,
                        Name = world.Name,
                        BackgroundImage = world.BackgroundImage,
                        Seed = seed,
                        Background = world.Background,
                        AllowTeleport = world.AllowTeleport,
                        ShowDisplays = world.ShowDisplays,
                        Weather = world.Weather,
                        CurrentDateTime = client.Manager.CurrentDatetime,
                        Music = world.Music.Length != 0 ? world.Music : 
                        new string[1] { client.Manager.CurrentDatetime >= 48000 ? "night" : "day" },
                        ClientXML = client.Manager.GameData.AdditionXml,
                        ExtraXML = world.ExtraXML
                    });
                    client.Stage = ProtocalStage.Handshaked;
                }
            }
        }
    }
}
