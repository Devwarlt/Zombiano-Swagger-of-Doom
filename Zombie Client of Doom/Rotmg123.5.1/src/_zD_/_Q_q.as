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

//_zD_._Q_q

package _zD_ {
import _C__.Mediator;

import _0L_C_._0D_W_;

import com.company.assembleegameclient.appengine.SavedCharacter;

import _U_5._057;

public class _Q_q extends Mediator {

    [Inject]
    public var view:_0D_W_;
    [Inject]
    public var character:SavedCharacter;
    [Inject]
    public var deleteCharacter:_057;

    override public function initialize():void {
        this.view.deleteCharacter.add(this._pk);
        this.view.cancel.add(this._09m);
        this.view._02C_(this.character.name(), this.character._jp());
    }

    override public function destroy():void {
        this.view.deleteCharacter.add(this._pk);
        this.view.cancel.add(this._09m);
    }

    private function _09m():void {
        this.view.parent.removeChild(this.view);
    }

    private function _pk():void {
        this._09m();
        this.deleteCharacter.dispatch(this.character);
    }

}
}//package _zD_

