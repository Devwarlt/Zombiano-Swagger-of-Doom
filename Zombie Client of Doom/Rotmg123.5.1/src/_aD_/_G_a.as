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

//_aD_._G_a

package _aD_ {
import _0M_m._j5;

import _sp.Signal;

import com.company.assembleegameclient.util._zR_;
import com.company.assembleegameclient.util.offer.Offers;
import com.company.assembleegameclient.parameters.Parameters;

import flash.net.navigateToURL;
import flash.net.URLRequest;

public class _G_a implements _09h {

    [Inject]
    public var _iq:_j5;
    private var _0G_z:Signal;

    public function _U_Z_(_arg1:_sv):void {
        var _local3:_zR_;
        var _local2:Offers = this._iq._U_t();
        Parameters.data_.paymentMethod = _local3;
        Parameters.save();
        _local3 = _zR_._8N_(_arg1.paymentMethod);
        var _local4:String = _local3._T_R_(_local2.tok, _local2.exp, _arg1.offer);
        navigateToURL(new URLRequest(_local4), "_blank");
        this.complete.dispatch();
    }

    public function get complete():Signal {
        return ((this._0G_z = ((this._0G_z) || (new Signal()))));
    }

}
}//package _aD_

