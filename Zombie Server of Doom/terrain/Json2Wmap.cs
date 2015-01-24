using Ionic.Zlib;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;

namespace terrain
{
    class Json2Wmap
    {
        private struct obj
        {
            public string name;
            public string id;
        }
        private struct loc
        {
            public string ground;
            public obj[] objs;
            public obj[] regions;
        }
        private struct json_dat
        {
            public byte[] data;
            public int width;
            public int height;
            public loc[] dict;
        }

        public static void Convert(XmlData data, string from, string to)
        {
            var x = Convert(data, File.ReadAllText(from));
            File.WriteAllBytes(to, x);
        }
        public static byte[] Convert(XmlData data, string json)
        {
            var obj = JsonConvert.DeserializeObject<json_dat>(json);
            var dat = ZlibStream.UncompressBuffer(obj.data);

            Dictionary<short, TerrainTile> tileDict = new Dictionary<short, TerrainTile>();
            for (int i = 0; i < obj.dict.Length; i++)
            {
                var o = obj.dict[i];
                tileDict[(short)i] = new TerrainTile()
                {
                    TileId = o.ground == null ? (ushort)0xff : data.IdToTileType[o.ground],
                    TileObj = o.objs == null ? null : o.objs[0].id,
                    Name = o.objs == null ? "" : o.objs[0].name ?? "",
                    Terrain = TerrainType.None,
                    Region = o.regions == null ? TileRegion.None : (TileRegion)Enum.Parse(typeof(TileRegion), o.regions[0].id.Replace(' ', '_'))
                };
            }

            var tiles = new TerrainTile[obj.width, obj.height];
            using (NReader rdr = new NReader(new MemoryStream(dat)))
                for (int y = 0; y < obj.height; y++)
                    for (int x = 0; x < obj.width; x++)
                    {
                        tiles[x, y] = tileDict[rdr.ReadInt16()];
                    }
            return WorldMapExporter.Export(tiles);
        }

        public static void ConvertReverse(XmlData data, string from, string to)
        {
            var x = ConvertReverse(data, File.ReadAllBytes(from));
            File.WriteAllText(to, x);
        }
        public static string ConvertReverse(XmlData data, byte[] wmap)
        {
            var obj = new json_dat();
            List<TerrainTile> terdict = new List<TerrainTile>();
            List<loc> dict = new List<loc>();

            List<byte> wmb = new List<byte>();
            foreach (var i in wmap)
                wmb.Add(i);
            wmb.RemoveAt(0);
            wmap = ZlibStream.UncompressBuffer(wmb.ToArray());

            List<byte> dat = new List<byte>();
            List<short> newDat = new List<short>();
            using (var rdr = new BinaryReader(new MemoryStream(wmap)))
            {
                short dicLength = rdr.ReadInt16();
                for (short i = 0; i < dicLength; i++)
                {
                    terdict.Add(new TerrainTile()
                    {
                        TileId = rdr.ReadUInt16(),
                        TileObj = rdr.ReadString(),
                        Name = rdr.ReadString(),
                        Terrain = (TerrainType)rdr.ReadByte(),
                        Region = (TileRegion)rdr.ReadByte()
                    });
                }
                obj.width = rdr.ReadInt32();
                obj.height = rdr.ReadInt32();
                dat = rdr.ReadBytes(obj.width * obj.height * 3).ToList();
            }
            using (var rdr = new BinaryReader(new MemoryStream(dat.ToArray())))
            {
                for (int i = 0; i < obj.width * obj.height; i++)
                {
                    newDat.Add(rdr.ReadInt16());
                    //rdr.ReadByte(); //Elevation, don't need
                }
            }
            foreach (var i in terdict)
            {
                dict.Add(new loc()
                {
                    ground = data.Tiles[i.TileId].ObjectId,
                    objs = i.TileObj == null ? null : new obj[] { new obj() { id = i.TileObj, name = i.Name } },
                    regions = i.Region == TileRegion.None ? null : new obj[] { new obj() { id = i.Region.ToString().Replace('_', ' '), name = "" } }
                });
            }

            MemoryStream s = new MemoryStream();
            using (var wtr = new NWriter(s))
            {
                foreach (var i in newDat)
                {
                    wtr.Write(i);
                }
            }

            obj.dict = dict.ToArray();

            obj.data = ZlibStream.CompressBuffer(s.ToArray());
            return JsonConvert.SerializeObject(obj);
        }
    }
}
