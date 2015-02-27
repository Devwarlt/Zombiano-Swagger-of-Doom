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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_tg._07k

package _tg {
import flash.events.Event;
import flash.display.BitmapData;

public class _07k extends Event {

    public static const LOAD_COMPLETE_EVENT:String = "LOAD_COMPLETE_EVENT";

    public var name_:String;
    public var type_:int;
    public var _0D_z:String;
    public var bitmapData_:BitmapData;

    public function _07k(_arg1:String, _arg2:int, _arg3:String, _arg4:BitmapData) {
        super(LOAD_COMPLETE_EVENT);
        this.name_ = _arg1;
        this.type_ = _arg2;
        this._0D_z = _arg3;
        this.bitmapData_ = _arg4;
    }

    override public function clone():Event {
        return (new _07k(this.name_, this.type_, this._0D_z, this.bitmapData_));
    }

}
}//package _tg

