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

//Panels.SimpleButtonPanel

package Panels{
import AccountManagement.ui.FancyTextButton;

import com.company.ui.SimpleText;
    import com.company.assembleegameclient.ui.boxButton;
    import flash.text.TextFieldAutoSize;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;
    import com.company.assembleegameclient.game.GameSprite;

    public class SimpleButtonPanel extends Panel {

        protected var text:SimpleText;
        protected var button:FancyTextButton;

        public function SimpleButtonPanel(_arg1:GameSprite, _arg2:String, _arg3:String){
            super(_arg1);
            this.text = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
            this.text.boldText(true);
            this.text.htmlText = (('<p align="center">' + _arg2) + "</p>");
            this.text.wordWrap = true;
            this.text.multiline = true;
            this.text.autoSize = TextFieldAutoSize.CENTER;
            this.text.filters = [new DropShadowFilter(0, 0, 0)];
            this.text.y = 6;
            addChild(this.text);
            this.button = new FancyTextButton(16, _arg3);
            this.button.addEventListener(MouseEvent.CLICK, this.onButtonClick);
            this.button.x = ((WIDTH / 2) - (this.button.width / 2));
            this.button.y = ((HEIGHT - this.button.height) - 4);
            addChild(this.button);
        }
        protected function onButtonClick(_arg1:MouseEvent):void{
        }

    }
}//package Panels

