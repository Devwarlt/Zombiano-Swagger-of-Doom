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

//Effects._7g

package Effects{
    import com.company.assembleegameclient.objects._Z_H_;
    import _0_P_._0F_7;

    public class _7g {

        public var id_:String;
        public var _Y_D_:_Z_H_;
        public var size_:int = 100;
        public var z_:Number = 0;
        public var duration_:Number = 0;
        public var _fe:_0F_7 = null;

        public function _7g(_arg1:XML){
            this.id_ = _arg1.@id;
            this._Y_D_ = new _Z_H_(_arg1);
            if (_arg1.hasOwnProperty("Size"))
            {
                this.size_ = Number(_arg1.Size);
            }
            if (_arg1.hasOwnProperty("Z"))
            {
                this.z_ = Number(_arg1.Z);
            }
            if (_arg1.hasOwnProperty("Duration"))
            {
                this.duration_ = Number(_arg1.Duration);
            }
            if (_arg1.hasOwnProperty("Animation"))
            {
                this._fe = new _0F_7(_arg1);
            }
        }
    }
}//package Effects

