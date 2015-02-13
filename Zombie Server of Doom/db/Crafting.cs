using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public struct Crafting : IEnumerable
{
    private static Dictionary<int, Crafting> m_craftingRecipes = new Dictionary<int, Crafting>
    {
        { 0, new Crafting(0, new int[9]
            {
                0,0,0,
                4000,4000,4001,
                0,4002,4001
            }, 4003)
        },
        { 1, new Crafting(1, new int[9]
            {
                0,0,0,
                4000,4000,4001,
                0,4001,4001,
            }, 24615)
        }
    };

    public static Crafting Default { get { return new Crafting(); } }

    private int m_id;
    private string m_row1;
    private string m_row2;
    private string m_row3;
    private int m_targetItem;

    public Crafting(int id, int[] recipe, int targetItem)
    {
        if (recipe.Length < 9) throw new ArgumentException("Invalid recipe\nLength should be 9", "recipe");
        this.m_id = id;
        this.m_row1 = String.Format("{0},{1},{2}", recipe[0], recipe[1], recipe[2]);
        this.m_row2 = String.Format("{0},{1},{2}", recipe[3], recipe[4], recipe[5]);
        this.m_row3 = String.Format("{0},{1},{2}", recipe[6], recipe[7], recipe[8]);
        this.m_targetItem = targetItem;
    }

    public int ID { get { return this.m_id; } }
    public int ResultItem { get { return this.m_targetItem; } }

    public static Crafting GetCraftingRecipeWithId(int id)
    {
        if (m_craftingRecipes.ContainsKey(id))
            return m_craftingRecipes[id];
        return default(Crafting);
    }

    public string GetRow(int row)
    {
        var field = typeof(Crafting).GetField("m_row" + row);
        if (field != null)
            return (string)field.GetValue(this);
        throw new ArgumentException("Invalid row\n1, 2 or 3 expected.", "row");
    }

    public CraftingEnumerator GetEnumerator()
    {
        return new CraftingEnumerator(m_craftingRecipes);
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return (IEnumerator)GetEnumerator();
    }

    public class CraftingEnumerator : IEnumerator
    {
        private readonly Dictionary<int, Crafting> m_items;
        private int m_pos;

        public CraftingEnumerator(Dictionary<int, Crafting> items)
        {
            this.m_items = items;
            this.m_pos = -1;
        }

        public object Current
        {
            get { return this.m_items.Values.ToArray<Crafting>()[this.m_pos]; }
        }

        public bool MoveNext()
        {
            this.m_pos++;
            return this.m_pos < this.m_items.Count;
        }

        public void Reset()
        {
            this.m_pos = -1;
        }
    }
}
