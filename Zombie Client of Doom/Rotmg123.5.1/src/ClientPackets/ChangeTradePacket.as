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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._2q

package ClientPackets {

import flash.utils.IDataOutput;


public class ChangeTradePacket extends ClientPacket {

    public var offer_:Vector.<Boolean>;

    public function ChangeTradePacket(_arg1:uint) {
        this.offer_ = new Vector.<Boolean>();
        super(_arg1);
    }

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeShort(this.offer_.length);
        var _local2:int;
        while (_local2 < this.offer_.length) {
            _arg1.writeBoolean(this.offer_[_local2]);
            _local2++;
        }
    }

    override public function toString():String {
        return (formatToString("CHANGETRADE", "offer_"));
    }

}
}//package ClientPackets

