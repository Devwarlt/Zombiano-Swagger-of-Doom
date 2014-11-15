﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.networking
{
    public enum PacketID_v123_4_4 : byte
    {
        Packet = 14,
        Reconnect = 4,
        Failure = 0,
        InvitedToGuild = 35,
        CreateGuildResult = 69,
        Damage = 38,
        File = 56,
        Pic = 3,
        Text = 7,
        Update = 5,
        AOE = 62,
        AllyShoot = 53,
        New_Tick = 57,
        TradeRequested = 36,
        TradeDone = 42,
        Notification = 63,
        Shoot = 21,
        MultiShoot = 31,
        NameResult = 67,
        AccountList = 66,
        GlobalNotification = 78,
        ClientStat = 46,
        Create_Success = 59,
        QuestObjId = 74,
        InvResult = 75,
        PlaySound = 13,
        BuyResult = 10,
        TradeStart = 9,
        TradeAccepted = 1,
        Show_Effect = 77,
        MapInfo = 37,
        Ping = 41,
        Goto = 50,
        TradeChanged = 44,
        Death = 47,
        Hello = 17,
        GuildRemove = 8,
        CreateGuild = 76,
        GuildInvite = 22,
        JoinGuild = 52,
        ChangeGuildRank = 60,
        Buy = 68,
        Create = 49,
        Teleport = 23,
        Pong = 27,
        Move = 61,
        PlayerShoot = 20,
        CheckCredits = 30,
        SquareHit = 16,
        ShootAck = 64,
        Escape = 33,
        PlayerText = 39,
        Load = 34,
        InvSwap = 65,
        GotoAck = 51,
        SetCondition = 28,
        EditAccountList = 55,
        RequestTrade = 48,
        OtherHit = 6,
        ChooseName = 40,
        PlayerHit = 18,
        AOEAck = 26,
        ChangeTrade = 12,
        UsePortal = 45,
        AcceptTrade = 15,
        UseItem = 58,
        CancelTrade = 25,
        EnemyHit = 24,
        InvDrop = 11
    }
    public enum PacketID : byte
    {
        Packet = 11,
        Reconnect = 39,
        Failure = 0,
        InvitedToGuild =77 ,
        CreateGuildResult = 58,
        Damage = 47,
        GroundDamage = 64,
        File = 55,
        Pic = 28,
        Text = 25,
        Update = 26,
        AOE = 68,
        AllyShoot = 74,
        New_Tick = 62,
        TradeRequested = 61,
        TradeDone = 12,
        Notification = 63,
        Shoot = 13,
        MultiShoot = 19,
        NameResult = 20,
        AccountList = 46,
        GlobalNotification = 9,
        ClientStat = 75,
        Create_Success = 31,
        QuestObjId = 34,
        InvResult = 4,
        PlaySound = 44,
        BuyResult = 27,
        TradeStart = 67,
        TradeAccepted = 18,
        Show_Effect = 56,
        MapInfo = 60,
        Ping = 6,
        Goto = 52,
        TradeChanged = 23,
        Death = 41,
        Hello = 17,
        GuildRemove = 78,
        CreateGuild = 15,
        GuildInvite = 8,
        JoinGuild = 5,
        ChangeGuildRank = 40,
        Buy = 50,
        Create = 36,
        Teleport = 49,
        Pong = 16,
        Move = 7,
        PlayerShoot = 38,
        CheckCredits = 48,
        SquareHit = 51,
        ShootAck = 22,
        Escape = 42,
        PlayerText = 69,
        Load = 45,
        InvSwap = 65,
        GotoAck = 14,
        SetCondition = 10,
        EditAccountList = 53,
        RequestTrade = 21,
        OtherHit = 66,
        ChooseName = 33,
        PlayerHit = 24,
        AOEAck = 59,
        ChangeTrade = 37,
        UsePortal = 3,
        AcceptTrade = 57,
        UseItem = 30,
        CancelTrade = 1,
        EnemyHit = 76,
        InvDrop = 35,
        NotificationBox = 81,
        Sprint = 85,
        TeleportRequest = 86
    }
}
