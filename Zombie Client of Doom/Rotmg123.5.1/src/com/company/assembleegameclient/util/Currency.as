// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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

