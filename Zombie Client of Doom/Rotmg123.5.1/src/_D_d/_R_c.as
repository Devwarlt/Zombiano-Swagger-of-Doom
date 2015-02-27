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

//_D_d._R_c

package _D_d {
import Frames.Frame;
import Frames.TextInput;
import Frames.TextInputBig;

import flash.events.MouseEvent;
import flash.events.Event;

public class _R_c extends Frame {

    public var _O_w:TextInput;

    public function _R_c(_arg1:String) {
        super("Tile properties", "Cancel", "Save", 300);
        this._O_w = new TextInputBig("Object Name", false, "");
        if (_arg1 != null) {
            this._O_w.inputText_.text = _arg1;
        }
        addTextInput(this._O_w);
        Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
        Button2.addEventListener(MouseEvent.CLICK, this._F_H_);
    }

    private function onCancel(_arg1:MouseEvent):void {
        dispatchEvent(new Event(Event.CANCEL));
    }

    private function _F_H_(_arg1:MouseEvent):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

}
}//package _D_d

