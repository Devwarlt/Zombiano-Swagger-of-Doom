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

//ClientPackets._fI_

package ClientPackets {
import com.company.assembleegameclient.net.messages.data.SlotObject;
import com.company.assembleegameclient.net.messages.data.Position;

import flash.utils.IDataOutput;

public class UseItemPacket extends ClientPacket {

    public var time_:int;
    public var slotObject_:SlotObject;
    public var itemUsePos_:Position;

    public function UseItemPacket(_arg1:uint) {
        this.slotObject_ = new SlotObject();
        this.itemUsePos_ = new Position();
        super(_arg1);
    }

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.time_);
        this.slotObject_.writeToOutput(_arg1);
        this.itemUsePos_.writeToOutput(_arg1);
    }

    override public function toString():String {
        return (formatToString("USEITEM", "slotObject_", "itemUsePos_"));
    }

}
}//package ClientPackets

