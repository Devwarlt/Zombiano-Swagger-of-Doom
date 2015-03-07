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

//com.company.net.Packet

package com.company.net {
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

public class Packet {

    public var id_:uint;

    public function Packet(packetId:uint) {
        this.id_ = packetId;
    }

    public function parseFromInput(_arg1:IDataInput):void {
    }

    public function writeToOutput(_arg1:IDataOutput):void {
    }

    public function toString():String {
        return (this.formatToString("MESSAGE", "id_"));
    }

    protected function formatToString(_arg1:String, ..._args):String {
        var _local3:String = ("[" + _arg1);
        var _local4:int;
        while (_local4 < _args.length) {
            _local3 = (_local3 + ((((" " + _args[_local4]) + '="') + this[_args[_local4]]) + '"'));
            _local4++;
        }
        return ((_local3 + "]"));
    }

}
}//package com.company.net

