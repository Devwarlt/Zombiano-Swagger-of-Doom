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

//ClientPackets._0L_P_

package ClientPackets {
import com.company.assembleegameclient.net.messages.data.Position;

import flash.utils.IDataOutput;

public class PlayerShootPacket extends ClientPacket {

    public var time_:int;
    public var bulletId_:uint;
    public var containerType_:int;
    public var startingPos_:Position;
    public var angle_:Number;

    public function PlayerShootPacket(_arg1:uint) {
        this.startingPos_ = new Position();
        super(_arg1);
    }

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.time_);
        _arg1.writeByte(this.bulletId_);
        _arg1.writeShort(this.containerType_);
        this.startingPos_.writeToOutput(_arg1);
        _arg1.writeFloat(this.angle_);
    }

    override public function toString():String {
        return (formatToString("PLAYERSHOOT", "time_", "bulletId_", "containerType_", "startingPos_", "angle_"));
    }

}
}//package ClientPackets

