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

//Frames._lx

package Frames{
    import com.company.assembleegameclient.game.GameSprite;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import _9R_.VillageResultEvent;

    public class CreateVillageFrame extends Frame {

        private var name_:TextInput;
        private var gs_:GameSprite;

        public function CreateVillageFrame(_arg1:GameSprite){
            super("Create a new Guild", "Cancel", "Create");
            this.gs_ = _arg1;
            this.name_ = new TextInput("Guild Name", false, "");
            this.name_.inputText_.restrict = "A-Za-z ";
            this.name_.inputText_.maxChars = 20;
            addTextInput(this.name_);
            addTextLine("Maximum 20 characters");
            addTextLine("No numbers or punctuation");
            addTextLine("Racism or profanity gets your guild banned");
            Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
            Button2.addEventListener(MouseEvent.CLICK, this._U_p);
        }
        private function onCancel(_arg1:MouseEvent):void{
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function _U_p(_arg1:MouseEvent):void{
            this.gs_.addEventListener(VillageResultEvent.VILLAGE_RESULT, this._0J_I_);
            this.gs_.packetManager.createVillage(this.name_.text());
            lockButtons();
        }
        private function _0J_I_(_arg1:VillageResultEvent):void{
            this.gs_.removeEventListener(VillageResultEvent.VILLAGE_RESULT, this._0J_I_);
            if (_arg1.success_)
            {
                dispatchEvent(new Event(Event.COMPLETE));
            } else
            {
                this.name_.setErrorText(_arg1.errorText_);
                releaseButtons();
            }
        }

    }
}//package Frames

