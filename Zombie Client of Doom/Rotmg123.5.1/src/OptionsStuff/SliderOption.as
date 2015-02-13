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

/**
 * Created by Fabian on 14.12.2014.
 */
package OptionsStuff {

import com.company.assembleegameclient.parameters.Parameters;
import flash.events.Event;


public class SliderOption extends _0_i {

    private var callback_:Function;
    private var slider:SliderBase;

    public function SliderOption(_arg1:String, _arg4:String, _arg5:String, _arg6:Function) {
        super(_arg1, _arg4, _arg5);
        this.callback_ = _arg6;
        this.slider = new SliderBase(0);
        this.slider.setValue(Parameters.data_[_W_Y_] * 100);
        this.slider.addEventListener(Event.CHANGE, this._bR_);
        addChild(this.slider);
    }

    override public function refresh():void {
        this.slider.setValue(Parameters.data_[_W_Y_] * 100);
    }

    private function _bR_(_arg1:Event):void {
        Parameters.data_[_W_Y_] = this.slider.value * 0.01;
        Parameters.save();
        if (this.callback_ != null) {
            this.callback_();
        }
    }
}
}//package OptionsStuff

