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

import _0_p.IConfig;
import _0_p.IContext;

import flash.display.DisplayObjectContainer;

import _eZ_.Injector;

import _E_E_.ISignalCommandMap;

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

public class InjectConstruct implements IConfig {

    [Inject]
    public var context:IContext;
    [Inject]
    public var _fR_:DisplayObjectContainer;
    [Inject]
    public var injector:Injector;
    [Inject]
    public var mapper:ISignalCommandMap;
    [Inject]
    public var mediatorMap:_v1;
    private var _Q_l:_0J_r;

    public function configure():void {
        this._A_v();
        this._ml();
        this._T_u();
        this._M_7();
        this._xD_();
        this.context._iL_._3a(this.init);
    }

    private function _A_v():void {
        this.injector.map(_B_d).asSingleton();
        this.injector.map(_0M_A_).asSingleton();
        this.injector.map(Domain).asSingleton();
        this.injector.map(CharListHistory).asSingleton();
        this.injector.map(SavedCraftingRecipes).asSingleton();
        this.injector.map(_G_J_).asSingleton();
    }

    private function _ml():void {
        this.mapper.map(_D_c, true).toCommand(_Y_R_);
        this.mapper.map(CharListResetDispatcher).toCommand(_0H_1);
        this.mapper.map(SpriteTarget).toCommand(_G_b);
        this.mapper.map(_06a).toCommand(_05L_);
    }

    private function _T_u():void {
        this.injector.map(_E_h).asSingleton();
        this.injector.map(_0D_5);
        this.injector.map(_Y_p);
        this.injector.map(_0F_A_);
    }

    private function _M_7():void {
        this.injector.map(_dd).asSingleton();
        this.injector.map(_6J_).asSingleton();
        this.injector.map(_0K_2).asSingleton();
        this.injector.map(_sC_).asSingleton();
        this.injector.map(_sT_).asSingleton();
        this.injector.map(_bo).asSingleton();
        this.injector.map(_zz)._q3(new _zz());
    }

    private function _xD_():void {
        this._Q_l = new _0J_r();
        this.injector.map(_0J_r)._q3(this._Q_l);
        this._fR_.addChild(this._Q_l);
        this.mediatorMap.map(WebMain).toMediator(_B_C_);
        this.mediatorMap.map(_C_6).toMediator(_gq);
    }

    private function init():void {
        this.mediatorMap._jS_(this._fR_);
        this._Q_l._Q_h.addChild(new _C_6());
    }

}
}

