using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

static class EnumerableUtils
{
    public static T RandomElement<T>(this IEnumerable<T> source, Random rng)
    {
        T current = default(T);
        int count = 0;
        foreach (T element in source)
        {
            count++;
            if (rng.Next(count) == 0)
            {
                current = element;
            }
        }
        if (count == 0)
        {
            throw new InvalidOperationException("Sequence was empty");
        }
        return current;
    }

    public static T RandomElement<T>(this IEnumerable<T> source, Random rng, Predicate<T> predict, bool allowNull = false)
    {
        T current = default(T);
        do
        {
            int count = 0;
            foreach (T element in source)
            {
                count++;
                if (rng.Next(count) == 0)
                {
                    if (predict(element))
                    {
                        current = element;
                    }
                }
            }
            if (count == 0)
            {
                throw new InvalidOperationException("Sequence was empty");
            }
        }
        while (current == null && !allowNull);
        return current;
    }
}

public static class Utils
{
    public static bool IsNumber(this string val)
    {
        int dummy;
        return Int32.TryParse(val, out dummy);
    }

    public static int FromString(string x)
    {
        if (x.StartsWith("0x")) return int.Parse(x.Substring(2), System.Globalization.NumberStyles.HexNumber);
        else return int.Parse(x);
    }
    public static string To4Hex(short x)
    {
        return "0x" + x.ToString("x4");
    }

    public static string GetCommaSepString<T>(T[] arr)
    {
        StringBuilder ret = new StringBuilder();
        for (var i = 0; i < arr.Length; i++)
        {
            if (i != 0) ret.Append(", ");
            ret.Append(arr[i].ToString());
        }
        return ret.ToString();
    }

    public static int[] FromCommaSepString32(string x)
    {
        if (String.IsNullOrWhiteSpace(x)) return new int[0];
        return x.Split(',').Select(_ => FromString(_.Trim())).ToArray();
    }

    public static ushort[] FromCommaSepString16(string x)
    {
        if (String.IsNullOrWhiteSpace(x)) return new ushort[0];
        return x.Split(',').Select(_ => (ushort)FromString(_.Trim())).ToArray();
    }

    public static int PriceToCopper(int price, int currency)
    {
        switch (currency)
        {
            case 0: return price * 10000; //Gold
            case 1: return price * 100; //Silver
            case 2: return price; //Copper
            default: throw new ArgumentException("Invalid currency");
        }
    }
}