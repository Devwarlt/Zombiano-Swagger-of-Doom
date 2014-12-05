using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using terrain;
using wServer.realm.terrain;

namespace wServer.realm.setpieces
{
    public class Outpost : ISetPiece
    {
        public int Size
        {
            get { return 300; }
        }

        public unsafe void RenderSetPiece(World world, IntPoint pos)
        {
            string json = File.ReadAllText("outpost.jm");

            GCHandle h = GCHandle.Alloc(world);
            IntPtr ptr = GCHandle.ToIntPtr(h);

            GCHandle mapHandle = GCHandle.Alloc(new Wmap(world.Manager.GameData));

            LoadJson(ptr.ToPointer(), json, &pos, GCHandle.ToIntPtr(mapHandle).ToPointer());

            Wmap map = (mapHandle.Target as Wmap);

            for (int y = 0; y < map.Height; y++)
            {
                for (int x = 0; x < map.Width; x++)
                {
                    try
                    {
                        if (map[x, y].TileId != 0 && map[x, y].TileId != 255)
                        {
                            var tile = world.Map[x + pos.X, y + pos.Y].Clone();
                            tile.TileId = map[x, y].TileId;
                            world.Map[x + pos.X, y + pos.Y] = tile;
                        }
                    }
                    catch { }
                }
            }
        }

        public unsafe void LoadJson(void* world, string json, IntPoint* pos, void* wmap)
        {
            FromWorldMap(new MemoryStream(Json2Wmap.Convert((GCHandle.FromIntPtr(new IntPtr(world)).Target as World).Manager.GameData, json)), world, pos, wmap);
        }

        private unsafe void FromWorldMap(System.IO.Stream dat, void* world, IntPoint* pos, void* wmap)
        {
            Wmap map = (GCHandle.FromIntPtr(new IntPtr(wmap)).Target as Wmap);
            map.Load(dat, 0);
            int w = map.Width, h = map.Height;

            pos->X = ((GCHandle.FromIntPtr(new IntPtr(world)).Target as World).Map.Width / 2) - (w / 2);
            pos->Y = ((GCHandle.FromIntPtr(new IntPtr(world)).Target as World).Map.Width / 2) - (w / 2);

            foreach (var i in map.InstantiateEntities((GCHandle.FromIntPtr(new IntPtr(world)).Target as World).Manager))
            {
                i.Move(i.X + pos->X, i.Y + pos->Y);
                (GCHandle.FromIntPtr(new IntPtr(world)).Target as World).EnterWorld(i);
            }
        }
    }
}
