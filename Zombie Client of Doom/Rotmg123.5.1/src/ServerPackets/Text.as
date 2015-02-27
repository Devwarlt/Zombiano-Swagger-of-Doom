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

//ServerPackets.Text

package ServerPackets {
import flash.utils.IDataInput;

public class Text extends ServerPacket {

    public var name_:String;
    public var objectId_:int;
    public var numStars_:int;
    public var bubbleTime_:uint;
    public var recipient_:String;
    public var text_:String;
    public var cleanText_:String;
    public var premium:Boolean;

    public function Text(_arg1:uint) {
        this.name_ = String("");
        this.text_ = String("");
        this.cleanText_ = String("");
        super(_arg1);
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        this.name_ = _arg1.readUTF();
        this.objectId_ = _arg1.readInt();
        this.numStars_ = _arg1.readInt();
        this.bubbleTime_ = _arg1.readUnsignedByte();
        this.recipient_ = _arg1.readUTF();
        this.text_ = _arg1.readUTF();
        this.cleanText_ = _arg1.readUTF();
        this.premium = _arg1.readBoolean();
    }

    override public function toString():String {
        return (formatToString("TEXT", "name_", "objectId_", "numStars_", "bubbleTime_", "recipient_", "text_", "cleanText_", "premium"));
    }

}
}//package ServerPackets

