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

//_00g._0H_i

package _00g {
import flash.events.EventDispatcher;

import com.company.assembleegameclient.util.offer.Offers;
import com.company.assembleegameclient.util.offer.Offer;

import _qN_._px;

import flash.events.Event;

public class _0H_i extends EventDispatcher {

    public var _0J_E_:Offers;
    public var _02Z_:Boolean;
    public var _d0:Boolean;
    public var _yI_:String;
    public var _Q_W_:String;
    public var offer:Offer;
    public var paymentMethod:String;
    public var _04Z_:_px;

    public function _8i():void {
        this._04Z_._0J_E_ = this._0J_E_;
        this._04Z_.offer = this.offer;
        this._04Z_.paymentMethod = this.paymentMethod;
        this._04Z_.mediator = this;
        this._04Z_.execute();
    }

    public function complete():void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    public function cancel():void {
        dispatchEvent(new Event(Event.CANCEL));
    }

}
}//package _00g

