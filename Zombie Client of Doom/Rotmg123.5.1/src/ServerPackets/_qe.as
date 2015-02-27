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

//ServerPackets._qe

package ServerPackets {
import flash.utils.IDataInput;

public class _qe extends ServerPacket {

    public var myOffer_:Vector.<Boolean>;
    public var yourOffer_:Vector.<Boolean>;

    public function _qe(_arg1:uint) {
        this.myOffer_ = new Vector.<Boolean>();
        this.yourOffer_ = new Vector.<Boolean>();
        super(_arg1);
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        var _local2:int;
        this.myOffer_.length = 0;
        var _local3:int = _arg1.readShort();
        _local2 = 0;
        while (_local2 < _local3) {
            this.myOffer_.push(_arg1.readBoolean());
            _local2++;
        }
        this.yourOffer_.length = 0;
        _local3 = _arg1.readShort();
        _local2 = 0;
        while (_local2 < _local3) {
            this.yourOffer_.push(_arg1.readBoolean());
            _local2++;
        }
    }

    override public function toString():String {
        return (formatToString("TRADEACCEPTED", "myOffer_", "yourOffer_"));
    }

}
}//package ServerPackets

