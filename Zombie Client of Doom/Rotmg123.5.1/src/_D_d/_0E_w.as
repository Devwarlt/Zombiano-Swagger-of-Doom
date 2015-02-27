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

//_D_d._0E_w

package _D_d {
import flash.display.Shape;

import com.company.assembleegameclient.map._sn;

import ToolTips.ToolTip;

public class _0E_w extends _P_u {

    public var _hI_:XML;

    public function _0E_w(_arg1:XML) {
        super(int(_arg1.@type));
        this._hI_ = _arg1;
        var _local2:Shape = new Shape();
        _local2.graphics.beginFill(_sn.getColor(type_), 0.5);
        _local2.graphics.drawRect(0, 0, (WIDTH - 8), (HEIGHT - 8));
        _local2.graphics.endFill();
        _local2.x = ((WIDTH / 2) - (_local2.width / 2));
        _local2.y = ((HEIGHT / 2) - (_local2.height / 2));
        addChild(_local2);
    }

    override protected function getToolTip():ToolTip {
        return (new _D_M_(this._hI_));
    }

}
}//package _D_d

