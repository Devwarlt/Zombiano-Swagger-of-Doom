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

//com.company.assembleegameclient.net.messages.data._Q_0

package com.company.assembleegameclient.net.messages.data {
import flash.geom.Point;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

public class Position {
    public var x_:Number;
    public var y_:Number;

    public function _6g():Point {
        return (new Point(this.x_, this.y_));
    }

    public function parseFromInput(_arg1:IDataInput):void {
        this.x_ = _arg1.readFloat();
        this.y_ = _arg1.readFloat();
    }

    public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeFloat(this.x_);
        _arg1.writeFloat(this.y_);
    }

    public function toString():String {
        return (((("x_: " + this.x_) + " y_: ") + this.y_));
    }
}
}//package com.company.assembleegameclient.net.messages.data

