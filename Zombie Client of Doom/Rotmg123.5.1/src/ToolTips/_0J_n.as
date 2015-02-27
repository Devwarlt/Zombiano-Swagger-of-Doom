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

//ToolTips._0J_n

package ToolTips {
public class _0J_n {

    public static const _rJ_:String = "#00FF00";
    public static const _at:String = "#FF0000";
    public static const _iF_:String = "#FFFF8F";

    public static function _M_w(_arg1:String, _arg2:String):String {
        return ('<font color="' + _arg2 + '">' + _arg1 + "</font>");
    }

    public static function _A_l(_arg1:Number):String {
        var _local2:Number = (_arg1 - int(_arg1));
        return (int(_local2 * 10) == 0 ? int(_arg1).toString() : _arg1.toFixed(1));
    }

    public static function _qy(_arg1:Number):String {
        if (_arg1 < 0) {
            return (_at);
        }
        if (_arg1 > 0) {
            return (_rJ_);
        }
        return (_iF_);
    }

}
}//package ToolTips

