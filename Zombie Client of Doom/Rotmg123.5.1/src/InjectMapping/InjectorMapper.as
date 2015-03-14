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

//InjectMapping._K_a

package InjectMapping {
import AccountManagement.AccountManagementScreenMediator;
import AccountManagement.AccountManagementScreen;

import Villages.nations.ChooseNationScreen;
import Villages.nations.ChooseNationScreenMediator;

import _0_p.IConfig;

import _F_1.CreditsScreen;

import _F_1.selectChars.CurrentCharacterScreen;
import _F_1.MapLoadingScreen;
import _F_1._01_;

import _F_1._05p;
import _F_1.NewsItem;

import _F_1._0H_2;
import _F_1._3V_;
import _F_1._C_Q_;
import _F_1.GameLoadingScreen;
import _F_1._U_W_;
import _F_1._zf;

import _eZ_.Injector;

import _0I_9._0J_r;

import _A_G_._v1;

import _E_E_.ISignalCommandMap;

import _U_5._D_c;

import _F_F_._V_2;

import _U_5._06a;

import _F_F_._0C_O_;

import _U_5._V_l;

import _0G__._E_Z_;

import _U_5._057;

import _0G__._M_y;

import _zD_._09b;

import _zD_._0D_h;
import _zD_.CreditsScreenMediator;
import _zD_._N_N_;
import _zD_.GameLoadingScreenMediator;
import _zD_.CurrentCharacterScreenMediator;
import _zD_._V_M_;
import _zD_.__for;
import _zD_._fy;
import _zD_._2H_;

import _D_d._hj;

import _zD_._0D_L_;

import com.company.assembleegameclient.screens.charrects.CurrentCharacterRect;

import _zD_.CurrentCharacterRectMediator;

import com.company.assembleegameclient.screens.charrects.CharacterRectList;

import _zD_.CharacterRectListMediator;

import _0L_C_._0G_y;

import _zD_._1k;

import _0L_C_._Z_t;

import _zD_._E_G_;
import _zD_.NewsItemMediator;

import _0L_C_._0D_W_;

import _zD_._Q_q;

import _0L_C_._s7;

import _zD_._G_9;
import _zD_.MapLoadingScreenMediator;

import _0M_H_._sN_;
import _0M_H_._R_W_;
import _0M_H_._W_O_;

import _F_F_._0L_J_;

import _zD_._Y_w;
import _zD_._yP_;

import com.company.assembleegameclient.ui.InventorySide;

import _zD_._B_9;

public class InjectorMapper implements IConfig {

    [Inject]
    public var _O_R_:Injector;
    [Inject]
    public var _Q_l:_0J_r;
    [Inject]
    public var mediatorMap:_v1;
    [Inject]
    public var _1G_:ISignalCommandMap;

    public function configure():void {
        this._1G_.map(_D_c, false).toCommand(_V_2);
        this._1G_.map(_06a).toCommand(_0C_O_);
        this._1G_.map(_V_l).toCommand(_E_Z_);
        this._1G_.map(_057).toCommand(_M_y);
        this.mediatorMap.map(_zf).toMediator(_0D_h);
        this.mediatorMap.map(GameLoadingScreen).toMediator(GameLoadingScreenMediator);
        this.mediatorMap.map(_01_).toMediator(_N_N_);
        this.mediatorMap.map(CreditsScreen).toMediator(CreditsScreenMediator);
        this.mediatorMap.map(CurrentCharacterScreen).toMediator(CurrentCharacterScreenMediator);
        this.mediatorMap.map(_05p).toMediator(_V_M_);
        this.mediatorMap.map(_C_Q_).toMediator(__for);
        this.mediatorMap.map(AccountManagementScreen).toMediator(AccountManagementScreenMediator);
        this.mediatorMap.map(ChooseNationScreen).toMediator(ChooseNationScreenMediator);
        this.mediatorMap.map(_3V_).toMediator(_fy);
        this.mediatorMap.map(_0H_2).toMediator(_2H_);
        this.mediatorMap.map(_hj).toMediator(_0D_L_);
        this.mediatorMap.map(CurrentCharacterRect).toMediator(CurrentCharacterRectMediator);
        this.mediatorMap.map(CharacterRectList).toMediator(CharacterRectListMediator);
        this.mediatorMap.map(_0G_y).toMediator(_1k);
        this.mediatorMap.map(_Z_t).toMediator(_E_G_);
        this.mediatorMap.map(_U_W_).toMediator(_09b);
        this.mediatorMap.map(NewsItem).toMediator(NewsItemMediator);
        this.mediatorMap.map(_0D_W_).toMediator(_Q_q);
        this.mediatorMap.map(_s7).toMediator(_G_9);
        this.mediatorMap.map(MapLoadingScreen).toMediator(MapLoadingScreenMediator);
        this._m6();
    }

    private function _m6():void {
        this._O_R_.map(_sN_)._q3(new _sN_());
        this._O_R_.map(_R_W_)._q3(new _R_W_());
        this._1G_.map(_W_O_).toCommand(_0L_J_);
        this.mediatorMap.map(_Y_w).toMediator(_yP_);
        this.mediatorMap.map(InventorySide).toMediator(_B_9);
    }

}
}//package InjectMapping

