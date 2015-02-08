// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util.Currency

package com.company.assembleegameclient.util{
    public class Currency {

        public static const INVALID:int = -1;
        public static const GOLD:int = 0;
        public static const SILVER:int = 1;
        public static const COPPER:int = 2;

        public static function _01r(_arg1:int):String{
            switch (_arg1)
            {
                case GOLD:
                    return ("Gold Coins");
                case SILVER:
                    return ("Silver Coins");
                case COPPER:
                    return ("Copper Coins");
            }
            return ("");
        }

        public static function parseCredits(credits:int):Object {
            return {
                "copper": int((credits - (int((credits / 10000)) * 10000) - (int(((credits - (int((credits / 10000)) * 10000)) / 100)) * 100))),
                "silver": int(((credits - (int((credits / 10000)) * 10000)) / 100)),
                "gold": int((credits / 10000)),
                "totalValue": credits
            };
        }
    }
}//package com.company.assembleegameclient.util

