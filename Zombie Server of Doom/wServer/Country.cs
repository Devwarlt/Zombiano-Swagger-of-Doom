using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer
{
    public class Country
    {
        private string m_name;
        private CountryType m_type;

        public string Name { get { return m_name; } }
        public CountryType Type { get { return m_type; } }

        public Country(CountryType type)
        {
            this.m_type = type;
            this.m_name = resolveCountryName();
        }

        private string resolveCountryName()
        {
            switch (this.m_type)
            {
                case CountryType.UnitedStates: return "United States of America";
                case CountryType.Germany: return "Germany";
                case CountryType.Israel: return "Israel";
                case CountryType.Canada: return "Canada";
                case CountryType.Vietnam: return "Vietnam";
                case CountryType.Netherlands: return "Netherlands";
                default: return "Unknown Country";
            }
        }
    }

    public enum CountryType : byte
    {
        UnitedStates = 0,
        Germany = 1,
        Israel = 2,
        Canada = 3,
        Vietnam = 4,
        Netherlands = 5
    }
}
