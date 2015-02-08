// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util._H_U_

package com.company.util{
    public class QueryHelper {

        public static function mergeQueries(base:Object, merge:Object):void{
            var _local3:String;
            for (_local3 in merge)
            {
                base[_local3] = merge[_local3];
            }
        }

    }
}//package com.company.util

