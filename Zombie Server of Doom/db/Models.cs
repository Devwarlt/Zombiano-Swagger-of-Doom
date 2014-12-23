﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using System.Xml.Serialization;

[Serializable, XmlRoot()]
public class Chars
{
    public Chars()
    {
        this._namespaces = new XmlSerializerNamespaces(new XmlQualifiedName[] {
                new XmlQualifiedName(string.Empty, "rotmg") 
            });
    }

    [XmlElement("Char")]
    public List<Char> Characters { get; set; }

    [XmlAttribute("nextCharId")]
    public int NextCharId { get; set; }
    [XmlAttribute("maxNumChars")]
    public int MaxNumChars { get; set; }

    public Account Account { get; set; }

    [XmlArray("News")]
    [XmlArrayItem("Item")]
    public List<NewsItem> News { get; set; }

    [XmlArray("Servers")]
    [XmlArrayItem("Server")]
    public List<ServerItem> Servers { get; set; }

    public double? Lat { get; set; }
    public double? Long { get; set; }

    [XmlNamespaceDeclarations]
    public XmlSerializerNamespaces Namespaces
    {
        get { return this._namespaces; }
    }
    private XmlSerializerNamespaces _namespaces;
}

[Serializable, XmlRoot()]
public class Account
{
    public Account()
    {
        this._namespaces = new XmlSerializerNamespaces(new XmlQualifiedName[] {
                new XmlQualifiedName(string.Empty, "rotmg") 
            });
        CraftingRecipes = new List<int>();
    }

    public int AccountId { get; set; }
    public string Name { get; set; }

    [XmlElement("NameChosen")]
    public string _NameChosen { get; set; }
    [XmlIgnore]
    public bool NameChosen { get { return this._NameChosen != null; } set { this._NameChosen = value ? "True" : null; } }

    [XmlElement("Converted")]
    public string _Converted { get; set; }
    [XmlIgnore]
    public bool Converted { get { return this._Converted != null; } set { this._Converted = value ? "True" : null; } }

    [XmlElement("Admin")]
    public string _Admin { get; set; }
    [XmlIgnore]
    public bool Admin { get { return this._Admin != null; } set { this._Admin = value ? "True" : null; } }

    [XmlElement("Gifts")]
    public string _Gifts
    {
        get { return Utils.GetCommaSepString(this.Gifts == null ? new int[0] : this.Gifts.ToArray()); }
        set { this.Gifts = Utils.FromCommaSepString32(value).ToList(); }
    }
    [XmlIgnore]
    public List<int> Gifts { get; set; }

    [XmlElement("OwnedSkins")]
    public string _OwnedSkins
    {
        get { return Utils.GetCommaSepString(this.OwnedSkins == null ? new int[0] : this.OwnedSkins.ToArray()); }
        set { this.OwnedSkins = Utils.FromCommaSepString32(value).ToList(); }
    }
    [XmlIgnore]
    public List<int> OwnedSkins { get; set; }
    [XmlElement("VerifiedEmail")]
    public string _VerifiedEmail { get; set; }
    [XmlIgnore]
    public bool VerifiedEmail { get { return this._VerifiedEmail != null; } set { this._VerifiedEmail = value ? "True" : null; } }
    [XmlIgnore]
    public List<int> CraftingRecipes { get; set; }

    public bool Premium { get; set; }

    [XmlElement("Rank")]
    public int Rank
    {
        get
        {
            if (this.Admin) return 13;
            else if (this.Kills > 0 && this.Kills < 100) return 1;
            else if (this.Kills > 99 && this.Kills < 500) return 2;
            else if (this.Kills > 499 && this.Kills < 1000) return 3;
            else if (this.Kills > 999 && this.Kills < 2000) return 4;
            else if (this.Kills > 1999 && this.Kills < 4000) return 5;
            else if (this.Kills > 3999 && this.Kills < 8000) return 6;
            else if (this.Kills > 7999 && this.Kills < 16000) return 7;
            else if (this.Kills > 15999 && this.Kills < 32000) return 8;
            else if (this.Kills > 31999 && this.Kills < 64000) return 9;
            else if (this.Kills > 63999 && this.Kills < 128000) return 10;
            else if (this.Kills > 127999 && this.Kills < 256000) return 11;
            else if (this.Kills > 255999) return 12;
            else return 0;
        }
        set { }
    }

    [XmlIgnore]
    public int Kills { get; set; }
    public int Credits { get; set; }
    public int NextCharSlotPrice { get; set; }
    public int? BeginnerPackageTimeLeft { get; set; }

    public VaultData Vault { get; set; }
    public Stats Stats { get; set; }
    public Guild Guild { get; set; }

    [XmlArray("News")]
    [XmlArrayItem("Item")]
    public List<NewsItem> News
    {
        get
        {
            return new List<NewsItem>
            {
                new NewsItem
                {
                    Date = 1419068064,
                    Icon = "bronzeFpcPack",
                    Link = "switchTo:FPC Packs",
                    TagLine = "Item: Bronze FPC Pack",
                    Title = "You received a new item."
                },
                new NewsItem
                {
                    Date = 1419068064,
                    Icon = "silverFpcPack",
                    Link = "switchTo:FPC Packs",
                    TagLine = "Item: Silver FPC Pack",
                    Title = "You received a new item."
                },
                new NewsItem
                {
                    Date = 1419068064,
                    Icon = "goldFpcPack",
                    Link = "switchTo:FPC Packs",
                    TagLine = "Item: Gold FPC Pack",
                    Title = "You received a new item."
                },
                new NewsItem
                {
                    Date = 1419068064,
                    Icon = "premiumFpcPack",
                    Link = "switchTo:FPC Packs",
                    TagLine = "Item: Premium FPC Pack",
                    Title = "You received a new item."
                },
                new NewsItem
                {
                    Date = 1419068063,
                    Icon = "premium",
                    Link = "switchTo:Premium",
                    TagLine = "You are now able to use special premium features",
                    Title = "Premium access purchased"
                }
            };
        }
        set { }
    }

    [XmlArray("FpcPacks")]
    [XmlArrayItem("Pack")]
    public List<FpcPackItem> FpcPacks { get; set; }


    [XmlArray("PremiumNews")]
    [XmlArrayItem("Item")]
    public List<PremiumNewsItem> PremiumNews
    {
        get
        {
            return new List<PremiumNewsItem>
            {
                new PremiumNewsItem
                {
                    StartDate = 1420121952,//1419340503,
                    EndDate = -1,
                    Icon = "fpcPack",
                    Description = "Your monthly Gold FPCpack for being a Premium member!",
                    Title = "GOLD FPCPACK"
                },
                new PremiumNewsItem
                {
                    StartDate = 1419340503,
                    EndDate = 1419426890,
                    Icon = "premiumEvent",
                    Description = "Every month there will be a different Premium Event in-game for members to participate in!",
                    Title = "PREMIUM EVENT"
                }
            };
        }
        set { }
    }


    [XmlNamespaceDeclarations]
    public XmlSerializerNamespaces Namespaces
    {
        get { return this._namespaces; }
    }
    private XmlSerializerNamespaces _namespaces;
}

[Serializable, XmlRoot()]
public class FpcPackItem
{
    [XmlAttribute("type")]
    public int Type { get; set; }
    [XmlAttribute("id")]
    public long Id { get; set; }
    [XmlAttribute("name")]
    public string Name { get; set; }
    public string Contents { get; set; }
}

[Serializable, XmlRoot()]
public class VaultData
{
    [XmlElement("Chest")]
    public List<VaultChest> Chests { get; set; }
}
public class VaultChest
{
    [XmlIgnore]
    public int ChestId { get; set; }
    [XmlText]
    public string _Items { get; set; }
    [XmlIgnore]
    public int[] Items
    {
        get { return Utils.FromCommaSepString32(_Items); }
        set { _Items = Utils.GetCommaSepString(value); }
    }
}
[Serializable, XmlRoot()]
public class Stats
{
    public int BestCharFame { get; set; }
    public int TotalFame { get; set; }
    public int Fame { get; set; }
    [XmlElement("ClassStats")]
    public List<ClassStats> ClassStates { get; set; }
}
[Serializable, XmlRoot()]
public class Guild
{
    [XmlAttribute("id")]
    public int Id { get; set; }
    public string Name { get; set; }
    public int Rank { get; set; }
}
[Serializable, XmlRoot()]
public class ClassStats
{
    [XmlAttribute("objectType")]
    public int ObjectType { get; set; }
    public int BestLevel { get; set; }
    public int BestFame { get; set; }
}

[Serializable, XmlRoot("Item")]
public class NewsItem
{
    public string Icon { get; set; }
    public string Title { get; set; }
    public string TagLine { get; set; }
    public string Link { get; set; }
    public int Date { get; set; }
}

[Serializable, XmlRoot("Item")]
public class PremiumNewsItem
{
    public string Icon { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public int StartDate { get; set; }
    public int EndDate { get; set; }
}

[Serializable, XmlRoot("Server")]
public class ServerItem
{
    public string Name { get; set; }
    public string DNS { get; set; }
    public double Lat { get; set; }
    public double Long { get; set; }
    public double Usage { get; set; }

    [XmlElement("AdminOnly")]
    string _AdminOnly { get; set; }
    [XmlIgnore]
    public bool AdminOnly { get { return this._AdminOnly != null; } set { this._AdminOnly = value ? "True" : null; } }
}

[Serializable, XmlRoot("Char")]
public class Char
{
    [XmlAttribute("id")]
    public int CharacterId { get; set; }
    public int ObjectType { get { return 0x030e; } set { } }
    [XmlElement("Skin")]
    public int SkinType { get; set; }
    public int Level { get; set; }
    public int Exp { get; set; }
    public int CurrentFame { get; set; }
    [XmlIgnore]
    public int Backpacks { get; set; }
    [XmlElement("Equipment")]
    public string _Equipment { get; set; }
    [XmlIgnore]
    public string _Backpack1 { get; set; }
    [XmlIgnore]
    public string _Backpack2 { get; set; }
    [XmlIgnore]
    public ushort[] Equipment
    {
        get { return Utils.FromCommaSepString16(_Equipment); }
        set { _Equipment = Utils.GetCommaSepString(value); }
    }
    [XmlIgnore]
    public ushort[] Backpack1
    {
        get { return Utils.FromCommaSepString16(_Backpack1); }
        set { _Backpack1 = Utils.GetCommaSepString(value); }
    }
    [XmlIgnore]
    public ushort[] Backpack2
    {
        get { return Utils.FromCommaSepString16(_Backpack2); }
        set { _Backpack2 = Utils.GetCommaSepString(value); }
    }

    public int MaxHitPoints { get; set; }
    public int HitPoints { get; set; }
    public int MaxMagicPoints { get; set; }
    public int MagicPoints { get; set; }
    public int Attack { get; set; }
    public int Defense { get; set; }
    public int Speed { get; set; }
    public int Dexterity { get; set; }
    public int HpRegen { get; set; }
    public int MpRegen { get; set; }
    public int Tex1 { get; set; }
    public int Tex2 { get; set; }
    public string PCStats { get; set; }
    [XmlIgnore]
    public FameStats FameStats { get; set; }
    public bool Dead { get; set; }
    public int Pet { get; set; }
}

[Serializable, XmlRoot]
public class Pics
{
    private XmlSerializerNamespaces _namespaces;

    public Pics()
    {
        _namespaces = new XmlSerializerNamespaces(new[]
        {
            new XmlQualifiedName(string.Empty, "rotmg")
        });
    }

    [XmlAttribute("offset")]
    public int Offset { get; set; }

    [XmlElement("Pic")]
    public List<Pic> Pictures = new List<Pic>();

    [XmlNamespaceDeclarations]
    public XmlSerializerNamespaces Namespaces
    {
        get { return _namespaces; }
    }
}

[Serializable, XmlRoot("Pic")]
public class Pic
{
    [XmlAttribute("id")]
    public int Id { get; set; }

    public string PicName { get; set; }
    public int DataType { get; set; }
    public string Tags { get; set; }
    public string Data { get; set; }
    public string Mine { get; set; }
}