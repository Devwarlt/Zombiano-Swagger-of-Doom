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

//_00g._02U_

package _00g {
import _qN_._px;

import com.company.assembleegameclient.util._zR_;
import com.company.assembleegameclient.parameters.Parameters;

import flash.net.navigateToURL;
import flash.net.URLRequest;
import flash.events.Event;

public class _02U_ extends _px {

    override public function execute():void {
        var _local1:_zR_;
        Parameters.data_.paymentMethod = _local1;
        Parameters.save();
        _local1 = _zR_._8N_(paymentMethod);
        var _local2:String = _local1._T_R_(_0J_E_.tok, _0J_E_.exp, offer);
        navigateToURL(new URLRequest(_local2), "_blank");
        if (mediator) {
            mediator.dispatchEvent(new Event(Event.COMPLETE));
        }
    }

}
}//package _00g

