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

//_F_1.News

package _F_1{
    import flash.display.Sprite;

    import com.company.assembleegameclient.appengine.NewsItem;
    import com.company.assembleegameclient.appengine.SavedCharsList;


    public class News extends Sprite {

        private var _dL_:Vector.<_0B_m>;

        public function News(_arg1:SavedCharsList){
            var _local2:NewsItem;
            this._dL_ = new Vector.<_0B_m>();
            super();
            for each (_local2 in _arg1.news_)
            {
                if (_local2.icon)
                {
                    this._yQ_(new _0B_m(_local2.icon, _local2._O_k, _local2._03P_, _local2._qh, _local2._W_e, _arg1.accountId_));
                }
            }
        }
        public function _yQ_(_arg1:_0B_m):void{
            _arg1.y = (4 + (this._dL_.length * (_0B_m.HEIGHT + 4)));
            this._dL_.push(_arg1);
            addChild(_arg1);
        }

    }
}//package _F_1

