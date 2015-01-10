
using System;
using System.IO;
using System.Runtime.InteropServices;
using terrain;
namespace wServer.realm.setpieces
{
    public abstract class SetPieceBase
    {
        public abstract int Size { get; }
        public abstract void RenderSetPiece(World world, IntPoint pos);

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

            var ens = map.InstantiateEntities((GCHandle.FromIntPtr(new IntPtr(world)).Target as World).Manager);

            foreach (var i in ens)
            {
                i.Move(i.X + pos->X, i.Y + pos->Y);
                (GCHandle.FromIntPtr(new IntPtr(world)).Target as World).EnterWorld(i);
            }
        }
    }
}
