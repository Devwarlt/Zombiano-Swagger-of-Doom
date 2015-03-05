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

//_C_5._tt

package _C_5 {
import _0_p._v;

import _eZ_._08b;

import _A_G_._v1;

import _E_E_._U_A_;

import _05Z_._D_m;

import com.company.assembleegameclient.game.GameSprite;

import _R_e.GameSpriteEventDispatcher;

import _05Z_._08i;

import _0J_2._qQ_;

public class _tt implements _v {

    [Inject]
    public var _O_R_:_08b;
    [Inject]
    public var mediatorMap:_v1;
    [Inject]
    public var _1G_:_U_A_;

    public function _K_():void {
        this._O_R_.map(_D_m)._hZ_();
        this.mediatorMap.map(GameSprite).to(GameSpriteEventDispatcher);
        this._1G_.map(_08i)._1N_(_qQ_);
    }

}
}//package _C_5

