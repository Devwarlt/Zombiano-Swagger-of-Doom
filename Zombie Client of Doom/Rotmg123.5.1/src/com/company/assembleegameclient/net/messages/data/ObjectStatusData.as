﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.net.messages.data.ObjectStatusData

package com.company.assembleegameclient.net.messages.data {

import com.company.assembleegameclient.util._wW_;

import flash.utils.IDataInput;
import flash.utils.IDataOutput;


public class ObjectStatusData {

    public var objectId_:int;
    public var pos_:Position;
    public var _086:Vector.<StatData>;

    public function ObjectStatusData() {
        this.pos_ = new Position();
        this._086 = new Vector.<StatData>();
        super();
    }

    public function parseFromInput(_arg1:IDataInput):void {
        var _local3:int;
        this.objectId_ = _arg1.readInt();
        this.pos_.parseFromInput(_arg1);
        var _local2:int = _arg1.readShort();
        _local3 = _local2;
        while (_local3 < this._086.length) {
            _wW_._ay(this._086[_local3]);
            _local3++;
        }
        this._086.length = Math.min(_local2, this._086.length);
        while (this._086.length < _local2) {
            this._086.push((_wW_._B_1(StatData) as StatData));
        }
        _local3 = 0;
        while (_local3 < _local2) {
            this._086[_local3].parseFromInput(_arg1);
            _local3++;
        }
    }

    public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.objectId_);
        this.pos_.writeToOutput(_arg1);
        _arg1.writeShort(this._086.length);
        var _local2:int;
        while (_local2 < this._086.length) {
            this._086[_local2].writeToOutput(_arg1);
            _local2++;
        }
    }

    public function toString():String {
        return (((((("objectId_: " + this.objectId_) + " pos_: ") + this.pos_) + " stats_: ") + this._086));
    }

}
}//package com.company.assembleegameclient.net.messages.data

