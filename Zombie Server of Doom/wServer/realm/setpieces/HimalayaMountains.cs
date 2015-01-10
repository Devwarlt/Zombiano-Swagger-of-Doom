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
    public class HimalayaMountains : SetPieceBase
    {
        public override int Size
        {
            get { return 300; }
        }

        public unsafe override void RenderSetPiece(World world, IntPoint pos)
        {
            string json = File.ReadAllText("himalaya.jm");

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
                            tile.ObjType = map[x, y].ObjType;
                            if (tile.ObjType != 0) tile.ObjId = world.GetNextEntityId();
                            world.Map[x + pos.X, y + pos.Y] = tile;
                        }
                    }
                    catch { }
                }
            }
        }
    }
}
