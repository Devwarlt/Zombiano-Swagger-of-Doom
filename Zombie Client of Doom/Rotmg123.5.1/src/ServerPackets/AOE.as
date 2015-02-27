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

//ServerPackets._05F_

package ServerPackets {
import com.company.assembleegameclient.net.messages.data.Position;

import flash.utils.IDataInput;

public class AOE extends ServerPacket {

    public var pos_:Position;
    public var radius_:Number;
    public var damage_:int;
    public var effect_:int;
    public var duration_:Number;
    public var origType_:int;

    public function AOE(_arg1:uint) {
        this.pos_ = new Position();
        super(_arg1);
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        this.pos_.parseFromInput(_arg1);
        this.radius_ = _arg1.readFloat();
        this.damage_ = _arg1.readUnsignedShort();
        this.effect_ = _arg1.readUnsignedByte();
        this.duration_ = _arg1.readFloat();
        this.origType_ = _arg1.readUnsignedShort();
    }

    override public function toString():String {
        return (formatToString("AOE", "pos_", "radius_", "damage_", "effect_", "duration_", "origType_"));
    }

}
}//package ServerPackets

