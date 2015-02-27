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

//_W_D_._B_d

package _W_D_ {
import flash.display.DisplayObjectContainer;
import flash.system.Capabilities;
import flash.display.LoaderInfo;

public class _B_d {

    private static var platform:_0I_z;

    private const _C_J_:String = "Desktop";

    [Inject]
    public var root:DisplayObjectContainer;

    public function _0B_z():Boolean {
        return (!((Capabilities.playerType == this._C_J_)));
    }

    public function _H_z():Boolean {
        return ((Capabilities.playerType == this._C_J_));
    }

    public function _R_K_():_0I_z {
        return ((platform = ((platform) || (this._gQ_()))));
    }

    private function _gQ_():_0I_z {
        var _local1:Object = LoaderInfo(this.root.stage.root.loaderInfo).parameters;
        if (this._P_R_(_local1)) {
            return (_0I_z._0C_i);
        }
        if (this._0J_x(_local1)) {
            return (_0I_z._I_6);
        }
        if (this._8w(_local1)) {
            return (_0I_z._nB_);
        }
        return (_0I_z._kj);
    }

    private function _P_R_(_arg1:Object):Boolean {
        return (!((_arg1.kongregate_api_path == null)));
    }

    private function _0J_x(_arg1:Object):Boolean {
        return (!((_arg1.steam_api_path == null)));
    }

    private function _8w(_arg1:Object):Boolean {
        return (!((_arg1.kabam_signed_request == null)));
    }

}
}//package _W_D_

