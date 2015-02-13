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

//com.company.assembleegameclient.objects.ClosedVaultChest

package com.company.assembleegameclient.objects{
    import ToolTips._aS_;
    import ToolTips.ToolTip;
    import flash.display.BitmapData;

    public class ClosedVaultChest extends SellableObject {

        public function ClosedVaultChest(_arg1:XML){
            super(_arg1);
        }
        override public function soldObjectName():String{
            return ("Vault Chest");
        }
        override public function soldObjectInternalName():String{
            return ("Vault Chest");
        }
        override public function getTooltip():ToolTip{
            return (new _aS_(0x500C00, 0x9B9B9B, this.soldObjectName(), ("A chest that will safely store 8 items and is " + "accessible by all of your characters."), 200));
        }
        override public function getIcon():BitmapData{
            return (ObjectLibrary.getRedrawnTextureFromType(ObjectLibrary._pb["Vault Chest"], 80, true));
        }

    }
}//package com.company.assembleegameclient.objects

