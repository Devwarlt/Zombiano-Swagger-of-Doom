
namespace wServer.networking.cliPackets
{
    public class CraftingPacket : ClientPacket
    {
        public int ObjectId { get; set; }
        public string RecipeString { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Crafting; }
        }

        public override Packet CreateInstance()
        {
            return new CraftingPacket();
        }

        protected override void Read(NReader rdr)
        {
            ObjectId = rdr.ReadInt32();
            RecipeString = rdr.ReadUTF();
        }
    }
}
