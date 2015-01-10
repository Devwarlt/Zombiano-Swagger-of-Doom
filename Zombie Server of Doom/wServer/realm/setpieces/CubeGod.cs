
namespace wServer.realm.setpieces
{
    class CubeGod : SetPieceBase
    {
        public override int Size { get { return 5; } }

        public override void RenderSetPiece(World world, IntPoint pos)
        {
            //Entity cube = Entity.Resolve(world.Manager, "Cube God");
            //cube.Move(pos.X + 2.5f, pos.Y + 2.5f);
            //world.EnterWorld(cube);
        }
    }
}
