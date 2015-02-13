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

//com.company.assembleegameclient.objects.GuildMerchant

package com.company.assembleegameclient.objects{
    import com.company.assembleegameclient.util.Currency;
    import com.company.assembleegameclient.util._07E_;
    import ToolTips._aS_;
    import ToolTips.ToolTip;
    import flash.display.BitmapData;

    public class GuildMerchant extends SellableObject implements IPanelProvider {

        public var description_:String;

        public function GuildMerchant(_arg1:XML){
            super(_arg1);
            price_ = int(_arg1.Price);
            currency_ = Currency.COPPER;
            this.description_ = _arg1.Description;
            _0F_S_ = _07E_._tS_;
        }
        override public function soldObjectName():String{
            return (ObjectLibrary._0D_N_[objectType_]);
        }
        override public function soldObjectInternalName():String{
            var _local1:XML = ObjectLibrary.Items[objectType_];
            return (_local1.@id.toString());
        }
        override public function getTooltip():ToolTip{
            return (new _aS_(0x500C00, 0x9B9B9B, this.soldObjectName(), this.description_, 200));
        }
        override public function getIcon():BitmapData{
            return (ObjectLibrary.getRedrawnTextureFromType(objectType_, 80, true));
        }

    }
}//package com.company.assembleegameclient.objects

