﻿

public enum CurrencyType
{
    Invalid = -1,
    Gold = 0,
    Silver = 1,
    Copper = 2
}

namespace wServer.realm
{
    public enum StatsType : byte
    {
        MaximumHP = 0,
        HP = 1,
        Size = 2,
        MaximumMP = 3,
        MP = 4,
        ExperienceGoal = 5,
        Experience = 6,
        Level = 7,
        Inventory0 = 8,
        Inventory1 = 9,
        Inventory2 = 10,
        Inventory3 = 11,
        Inventory4 = 12,
        Inventory5 = 13,
        Inventory6 = 14,
        Inventory7 = 15,
        Inventory8 = 16,
        Inventory9 = 17,
        Inventory10 = 18,
        Inventory11 = 19,
        Attack = 20,
        Defense = 21,
        Speed = 22,
        Vitality = 26,
        Wisdom = 27,
        Dexterity = 28,
        Effects = 29,
        Rank = 30,
        Name = 31,
        Texture1 = 32,
        Texture2 = 33,
        MerchantMerchandiseType = 34,
        Credits = 35,
        SellablePrice = 36,
        PortalUsable = 37,
        AccountId = 38,
        CurrentFame = 39,
        SellablePriceCurrency = 40,
        ObjectConnection = 41,
        /*
         * Mask :F0F0F0F0
         * each byte -> type
         * 0:Dot
         * 1:ShortLine
         * 2:L
         * 3:Line
         * 4:T
         * 5:Cross
         * 0x21222112
        */
        MerchantRemainingCount = 42,
        MerchantRemainingMinute = 43,
        MerchantDiscount = 44,
        SellableRankRequirement = 45,
        HPBoost = 46,
        MPBoost = 47,
        AttackBonus = 48,
        DefenseBonus = 49,
        SpeedBonus = 50,
        VitalityBonus = 51,
        WisdomBonus = 52,
        DexterityBonus = 53,
        OwnerAccountId = 54,
        NameChangerStar = 55,
        NameChosen = 56,
        Fame = 57,
        FameGoal = 58,
        Premium = 59,
        SinkOffset = 60,
        AltTextureIndex = 61,
        Guild = 62,
        GuildRank = 63,
        OxygenBar = 64,
        _bk = 65,
        SKIN_STAT = 66,
        PVP_STAT = 67,
        TEAM_STAT = 68,
        AbilityCooldown = 69,
        VisibilityRange = 70,

        Backpack1_0 = 71,
        Backpack1_1 = 72,
        Backpack1_2 = 73,
        Backpack1_3 = 74,
        Backpack1_4 = 75,
        Backpack1_5 = 76,
        Backpack1_6 = 77,
        Backpack1_7 = 78,

        Backpack2_0 = 79,
        Backpack2_1 = 80,
        Backpack2_2 = 81,
        Backpack2_3 = 82,
        Backpack2_4 = 83,
        Backpack2_5 = 84,
        Backpack2_6 = 85,
        Backpack2_7 = 86,

        HasBackpack1 = 87,
        HasBackpack2 = 88,
        Effect = 89
    }
}
