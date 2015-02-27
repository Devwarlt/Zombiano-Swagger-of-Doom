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

package _G_A_ {
import Crafting.SavedCraftingRecipes;

import _0_p._v;
import _0_p.IContext;

import flash.display.DisplayObjectContainer;

import _eZ_._08b;

import _E_E_._U_A_;

import _A_G_._v1;

import _0I_9._0J_r;

import _W_D_._B_d;
import _W_D_._0M_A_;
import _W_D_.Domain;
import _W_D_.CharListHistory;
import _W_D_._G_J_;

import _U_5._D_c;

import _0G__._Y_R_;

import _U_5.CharListResetDispatcher;

import _0G__._0H_1;

import _U_5.SpriteTarget;

import _0G__._G_b;

import _U_5._06a;

import _0G__._05L_;

import _4X_._E_h;

import _02b._0D_5;
import _02b._Y_p;
import _02b._0F_A_;

import _U_5._dd;
import _U_5._6J_;
import _U_5._0K_2;
import _U_5._sC_;
import _U_5._sT_;
import _U_5._bo;
import _U_5._zz;

import _0I_9._B_C_;
import _0I_9._C_6;
import _0I_9._gq;

public class InjectConstruct implements _v {

    [Inject]
    public var context:IContext;
    [Inject]
    public var _fR_:DisplayObjectContainer;
    [Inject]
    public var definitions:_08b;
    [Inject]
    public var mapper:_U_A_;
    [Inject]
    public var mediatorMap:_v1;
    private var _Q_l:_0J_r;

    public function _K_():void {
        this._A_v();
        this._ml();
        this._T_u();
        this._M_7();
        this._xD_();
        this.context._iL_._3a(this.init);
    }

    private function _A_v():void {
        this.definitions.map(_B_d)._hZ_();
        this.definitions.map(_0M_A_)._hZ_();
        this.definitions.map(Domain)._hZ_();
        this.definitions.map(CharListHistory)._hZ_();
        this.definitions.map(SavedCraftingRecipes)._hZ_();
        this.definitions.map(_G_J_)._hZ_();
    }

    private function _ml():void {
        this.mapper.map(_D_c, true)._1N_(_Y_R_);
        this.mapper.map(CharListResetDispatcher)._1N_(_0H_1);
        this.mapper.map(SpriteTarget)._1N_(_G_b);
        this.mapper.map(_06a)._1N_(_05L_);
    }

    private function _T_u():void {
        this.definitions.map(_E_h)._hZ_();
        this.definitions.map(_0D_5);
        this.definitions.map(_Y_p);
        this.definitions.map(_0F_A_);
    }

    private function _M_7():void {
        this.definitions.map(_dd)._hZ_();
        this.definitions.map(_6J_)._hZ_();
        this.definitions.map(_0K_2)._hZ_();
        this.definitions.map(_sC_)._hZ_();
        this.definitions.map(_sT_)._hZ_();
        this.definitions.map(_bo)._hZ_();
        this.definitions.map(_zz)._q3(new _zz());
    }

    private function _xD_():void {
        this._Q_l = new _0J_r();
        this.definitions.map(_0J_r)._q3(this._Q_l);
        this._fR_.addChild(this._Q_l);
        this.mediatorMap.map(WebMain)._Y_u(_B_C_);
        this.mediatorMap.map(_C_6)._Y_u(_gq);
    }

    private function init():void {
        this.mediatorMap._jS_(this._fR_);
        this._Q_l._Q_h.addChild(new _C_6());
    }

}
}

