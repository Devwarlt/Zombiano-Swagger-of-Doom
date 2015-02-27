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

//_0L_C_._0G_H_

package _0L_C_ {
import _qN_.Account;

import flash.events.Event;

public class _0G_H_ extends DialogBox {

    public function _0G_H_(_arg1:int) {
        super(((("Another character slot costs " + _arg1) + " Gold.  ") + "Would you like to buy Gold?"), "Not Enough Gold", "Cancel", "Buy Gold");
        Account._get().cacheOffers();
        addEventListener(BUTTON1_EVENT, this.onCancel);
        addEventListener(BUTTON2_EVENT, this._8v);
    }

    public function onCancel(_arg1:Event):void {
        parent.removeChild(this);
    }

    public function _8v(_arg1:Event):void {
        Account._get().showMoneyManagement(stage);
        parent.removeChild(this);
    }

}
}//package _0L_C_

