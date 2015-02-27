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

//ServerPackets._C_3

package ServerPackets {
import com.company.assembleegameclient.net.messages.data.Position;

import flash.utils.IDataInput;

public class _C_3 extends ServerPacket {

    public var bulletId_:uint;
    public var ownerId_:int;
    public var bulletType_:int;
    public var startingPos_:Position;
    public var angle_:Number;
    public var damage_:int;
    public var numShots_:int;
    public var angleInc_:Number;

    public function _C_3(_arg1:uint) {
        this.startingPos_ = new Position();
        super(_arg1);
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        this.bulletId_ = _arg1.readUnsignedByte();
        this.ownerId_ = _arg1.readInt();
        this.bulletType_ = _arg1.readUnsignedByte();
        this.startingPos_.parseFromInput(_arg1);
        this.angle_ = _arg1.readFloat();
        this.damage_ = _arg1.readShort();
        if (_arg1.bytesAvailable > 0) {
            this.numShots_ = _arg1.readUnsignedByte();
            this.angleInc_ = _arg1.readFloat();
        } else {
            this.numShots_ = 1;
            this.angleInc_ = 0;
        }
    }

    override public function toString():String {
        return (formatToString("SHOOT", "bulletId_", "ownerId_", "bulletType_", "startingPos_", "angle_", "damage_", "numShots_", "angleInc_"));
    }

}
}//package ServerPackets

