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

//_D_d._Q_H_

package _D_d {
import _D_d._P_u;

import com.company.assembleegameclient.objects.ObjectLibrary;

import flash.display.BitmapData;
import flash.display.Bitmap;

import _D_d._9o;

import ToolTips.ToolTip;

import _D_d.*;

internal class _Q_H_ extends _P_u {

    public var _J_i:XML;

    public function _Q_H_(_arg1:XML) {
        super(int(_arg1.@type));
        this._J_i = _arg1;
        var _local2:BitmapData = ObjectLibrary.getRedrawnTextureFromType(type_, 100, true, false);
        var _local3:Bitmap = new Bitmap(_local2);
        var _local4:Number = ((WIDTH - 4) / Math.max(_local3.width, _local3.height));
        _local3.scaleX = (_local3.scaleY = _local4);
        _local3.x = ((WIDTH / 2) - (_local3.width / 2));
        _local3.y = ((HEIGHT / 2) - (_local3.height / 2));
        addChild(_local3);
    }

    override protected function getToolTip():ToolTip {
        return (new _9o(this._J_i));
    }

}
}//package _D_d

