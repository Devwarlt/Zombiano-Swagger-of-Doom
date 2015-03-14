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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_I_j._V_4

package _I_j {
import _0_p.IConfig;

import _eZ_.Injector;

import _A_G_._v1;

import _E_E_.ISignalCommandMap;

import _0M_m._j5;
import _0M_m._0E_v;
import _0M_m._00V_;
import _0M_m._E_e;

import _nA_._ax;
import _nA_._bN_;
import _nA_._0F_U_;
import _nA_._07N_;
import _nA_._O_g;
import _nA_._V_y;

import _P_E_._W_2;

import _R_S_._I_y;

public class _V_4 implements IConfig {

    [Inject]
    public var _O_R_:Injector;
    [Inject]
    public var mediatorMap:_v1;
    [Inject]
    public var _1G_:ISignalCommandMap;

    public function configure():void {
        this._O_R_.map(_j5)._00S_(_0E_v);
        this._O_R_.map(_00V_)._00S_(_E_e);
        this.mediatorMap.map(_ax).toMediator(_bN_);
        this.mediatorMap.map(_0F_U_).toMediator(_07N_);
        this.mediatorMap.map(_O_g).toMediator(_V_y);
        this._1G_.map(_W_2).toCommand(_I_y);
    }

}
}//package _I_j

