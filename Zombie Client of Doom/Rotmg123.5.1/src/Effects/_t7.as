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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Effects._t7

package Effects {
public class _t7 extends _06s {

    private var _H_s:Number;

    public function _t7(_arg1:int, _arg2:int, _arg3:int, _arg4:Number, _arg5:Number, _arg6:Number, _arg7:Number) {
        this._H_s = _arg4;
        super(_arg1, _arg2, _arg3, _arg5, _arg6, _arg7);
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local4:Number;
        timeLeft_ = (timeLeft_ - _arg2);
        if (timeLeft_ <= 0) {
            return (false);
        }
        if (((_0H_B_.obj_) && (_0H_B_.obj_.props_.static_))) {
            return (false);
        }
        var _local3:Number = (Math.random() * this._H_s);
        _local4 = (Math.random() * this._H_s);
        x_ = (x_ + (((dx_ * _local3) * _arg2) / 1000));
        y_ = (y_ + (((dy_ * _local4) * _arg2) / 1000));
        _H_9(((timeLeft_ / lifetime_) * initialSize_));
        return (true);
    }

}
}//package Effects

