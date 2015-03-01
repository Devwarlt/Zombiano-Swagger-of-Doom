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

//_F_F_._V_2

package _F_F_ {
import Abstract.AbstractManager;

import Language.LanguageManager;

import _F_1.GameLoadingScreen;

import _W_D_.Domain;

import _U_5._dd;

import com.company.assembleegameclient.appengine.WebRequest;

import com.company.assembleegameclient.util.loadEmbeds;

import _0I_9._05b;

import flash.display.Sprite;
import flash.net.URLRequestDefaults;

public class _V_2 {

    [Inject]
    public var domain:Domain;
    [Inject]
    public var _T__:_dd;

    public function execute():void {

        //URLRequestDefaults.userAgent = WebRequest.USER_AGENT;
        loadEmbeds();
        AbstractManager.register();
        LanguageManager.load(this.dispatch);
    }

    private function _0E_M_():Sprite {
        return (((this.domain._F_N_()) ? new GameLoadingScreen() : new _05b()));
    }

    private function dispatch():void {
        this._T__.dispatch(this._0E_M_());
    }
}
}//package _F_F_

