
namespace wServer.networking.cliPackets
{
    public class LearnCraftingRecipePacket : ClientPacket
    {
        public int SlotId { get; set; }
        public int ItemId { get; set; }
        public int RecipeId { get; set; }

        public override PacketID ID
        {
            get { return PacketID.LearnCraftingRecipe; }
        }

        public override Packet CreateInstance()
        {
            return new LearnCraftingRecipePacket();
        }

        protected override void Read(NReader rdr)
        {
            SlotId = rdr.ReadInt32();
            ItemId = rdr.ReadInt32();
            RecipeId = rdr.ReadInt32();
        }

        protected override void Write(NWriter wtr)
        {
        }
    }
}
