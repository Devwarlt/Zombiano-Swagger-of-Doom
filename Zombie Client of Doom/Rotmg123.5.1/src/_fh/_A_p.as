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

//_fh._A_p

package _fh{
    import ToolTips._zY_;
    import flash.events.MouseEvent;
    import com.company.assembleegameclient.objects.Player;
    import _0D_B_._06M_;
    import _0D_B_.Menu;
    import com.company.assembleegameclient.objects.GameObject;



    public class _A_p extends _rB_ {

        public function _A_p(){
            super(0xFFFFFF, 4179794, false);
        }
        override protected function onMouseOver(_arg1:MouseEvent):void{
            super.onMouseOver(_arg1);
            _V_B_(new _zY_(this._K_M_(), false));
        }
        override protected function onMouseOut(_arg1:MouseEvent):void{
            super.onMouseOut(_arg1);
            _V_B_(null);
        }
        override protected function onMouseDown(_arg1:MouseEvent):void{
            super.onMouseDown(_arg1);
            _7C_();
            _06R_(this._rI_());
        }
        protected function _rI_():Menu{
            var _local1:Player = (go_ as Player);
            if ((((_local1 == null)) || ((_local1.map_ == null))))
            {
                return (null);
            }
            var _local2:Player = _local1.map_.player_;
            if (_local2 == null)
            {
                return (null);
            }
            return (new _06M_(_local1.map_, this._K_M_()));
        }
        private function _K_M_():Vector.<Player>{
            var _local2:GameObject;
            var _local1:Vector.<Player> = new <Player>[(go_ as Player)];
            for each (_local2 in _rM_)
            {
                _local1.push((_local2 as Player));
            }
            return (_local1);
        }

    }
}//package _fh

