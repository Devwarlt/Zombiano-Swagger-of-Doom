using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public struct Achievement : IEnumerable
{
    private static Dictionary<int, Achievement> m_achievements = new Dictionary<int, Achievement>
    {
        { 0, new Achievement(0, "Learn to play", "Enter the tutorial", AchievementGUID.EnterTutorial) },
        { 1, new Achievement(1, "I learned it", "Complete the tutorial", AchievementGUID.CompleteTutorial) },
        { 2, new Achievement(2, "Look what I found", "Loot 1 item from the ground", AchievementGUID.LootbagPickup) },
        { 3, new Achievement(3, "Ice cold bitch ass killer", "Kill 1 player", AchievementGUID.PlayerKilled) },
        { 4, new Achievement(4, "I am now unique ^-^", "Choose a name", AchievementGUID.ChooseName) },
        { 5, new Achievement(5, "My first kill *-*", "Kill 1 monster", AchievementGUID.MonsterKilled) },
        { 6, new Achievement(6, "PROOOMOTED", "Reach rank: PFC.", AchievementGUID.PfcRankReached) },
        { 7, new Achievement(7, "My First Village", "Create a village", AchievementGUID.CreateVillage) },
        { 8, new Achievement(8, "Hi, I am new", "Join an existing village", AchievementGUID.JoinOtherVillage) },
        { 9, new Achievement(9, "Welcome to america", "Visit america", AchievementGUID.VisitAmerica) },
        { 10, new Achievement(10, "u r cool", "Type: \"u r cool\" in the chat", AchievementGUID.URCOOL) },
        { 11, new Achievement(11, "Now I am a specialist", "Reach rank: SPC.", AchievementGUID.SpcRankReached) },
        { 12, new Achievement(12, "It looks so beautiful", "Craft 1 item", AchievementGUID.CraftItem) },
        { 13, new Achievement(13, "Yey", "Choose a nation", AchievementGUID.ChoosedNation) },
        { 14, new Achievement(14, "I am a unicorn", "Find the secret unicorn Easter Egg", AchievementGUID.Unicorn) }
    };

    public static Achievement Default { get { return new Achievement(); } }

    private int m_id;
    private string m_title;
    private string m_description;
    private AchievementGUID m_guid;
    

    public Achievement(int id, string title, string description, AchievementGUID guid)
    {
        this.m_id = id;
        this.m_title = title;
        this.m_description = description;
        this.m_guid = guid;
    }

    public bool UnknownAchievement { get { return this.ID == 0 && this.Title == null && this.Description == null; } }
    public int ID { get { return this.m_id; } }
    public string Title { get { return this.m_title; } }
    public string Description { get { return this.m_description; } }
    public AchievementGUID GUID { get { return this.m_guid; } }

    public static Achievement GetAchievementWithId(int id)
    {
        if (m_achievements.ContainsKey(id))
            return m_achievements[id];
        return default(Achievement);
    }

    public static Achievement GetAchievementWithGUID(AchievementGUID guid)
    {
        foreach (var ac in m_achievements)
            if (ac.Value.m_guid == guid)
                return ac.Value;
        return default(Achievement);
    }

    public AchievementEnumerator GetEnumerator()
    {
        return new AchievementEnumerator(m_achievements);
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return (IEnumerator)GetEnumerator();
    }

    public class AchievementEnumerator : IEnumerator
    {
        private readonly Dictionary<int, Achievement> m_items;
        private int m_pos;

        public AchievementEnumerator(Dictionary<int, Achievement> items)
        {
            this.m_items = items;
            this.m_pos = -1;
        }


        public object Current
        {
            get { return this.m_items.Values.ToArray<Achievement>()[this.m_pos]; }
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

public class AchievementGUID
{
    private string m_guid;
    public string GUID { get { return m_guid; } }

    private AchievementGUID(string guid)
    {
        this.m_guid = guid;
    }

    public static implicit operator AchievementGUID (string guid)
    {
        return new AchievementGUID(guid);
    }

    public static readonly AchievementGUID EnterTutorial =              "enterTutorial";
    public static readonly AchievementGUID CompleteTutorial =           "completeTutorial";
    public static readonly AchievementGUID LootbagPickup =              "lootBagPickUp";
    public static readonly AchievementGUID PlayerKilled =               "playerKilled";
    public static readonly AchievementGUID ChooseName =                 "chooseName";
    public static readonly AchievementGUID MonsterKilled =              "monsterKilled";
    public static readonly AchievementGUID PfcRankReached =             "reachedPfcRank";
    public static readonly AchievementGUID CreateVillage =              "createVillage";
    public static readonly AchievementGUID JoinOtherVillage =           "otherVillageJoin";
    public static readonly AchievementGUID VisitAmerica =               "americaVisit";
    public static readonly AchievementGUID URCOOL =                     "URCOOL";
    public static readonly AchievementGUID SpcRankReached =             "reachedSpcRank";
    public static readonly AchievementGUID CraftItem =                  "craftItem";

    public static readonly AchievementGUID OwnPlayerKilledByMonster =   "ownPlayerKilledByMonster";
    public static readonly AchievementGUID OwnPlayerKilledByPlayer =    "ownPlayerKilledByPlayer";
    public static readonly AchievementGUID EnterPortal =                "enterPortal";
    public static readonly AchievementGUID ChoosedNation =              "choosedNation";

    public static readonly AchievementGUID EnterWorld =                 "enterWorld";
    public static readonly AchievementGUID Unicorn =                    "iAmAUnicorn";
}
