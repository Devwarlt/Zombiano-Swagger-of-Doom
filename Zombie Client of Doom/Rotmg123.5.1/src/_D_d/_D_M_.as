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

//_D_d._D_M_

package _D_d{
    import ToolTips.ToolTip;
    import com.company.ui.SimpleText;
    import flash.filters.DropShadowFilter;

    public class _D_M_ extends ToolTip {

        private static const _be:int = 180;

        private var _P_V_:SimpleText;

        public function _D_M_(_arg1:XML){
            super(0x363636, 1, 0x9B9B9B, 1, true);
            this._P_V_ = new SimpleText(16, 0xFFFFFF, false, (_be - 4), 0, "Myriad Pro");
            this._P_V_.boldText(true);
            this._P_V_.wordWrap = true;
            this._P_V_.text = String(_arg1.@id);
            this._P_V_._08S_();
            this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
            this._P_V_.x = 0;
            this._P_V_.y = 0;
            addChild(this._P_V_);
        }
    }
}//package _D_d

