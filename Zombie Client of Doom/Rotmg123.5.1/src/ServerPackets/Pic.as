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

//ServerPackets.Pic

package ServerPackets {
import flash.display.BitmapData;
import flash.utils.ByteArray;
import flash.utils.IDataInput;

public class Pic extends ServerPacket {

    public var bitmapData_:BitmapData = null;

    public function Pic(_arg1:uint) {
        super(_arg1);
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        var _local2:int = _arg1.readInt();
        var _local3:int = _arg1.readInt();
        var _local4:ByteArray = new ByteArray();
        _arg1.readBytes(_local4, 0, ((_local2 * _local3) * 4));
        this.bitmapData_ = new BitmapData(_local2, _local3);
        this.bitmapData_.setPixels(this.bitmapData_.rect, _local4);
    }

    override public function toString():String {
        return (formatToString("PIC", "bitmapData_"));
    }

}
}//package ServerPackets

