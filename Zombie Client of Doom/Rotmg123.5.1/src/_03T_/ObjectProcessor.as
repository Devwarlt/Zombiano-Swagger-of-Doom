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

//_03T_.ObjectProcessor

package _03T_ {
import _qj._pn;

public class ObjectProcessor {

    private const _handlers:Array = [];

    public function _K_j(_arg1:_pn, _arg2:Function):void {
        this._handlers.push(new ObjectHandler(_arg1, _arg2));
    }

    public function _049(_arg1:Object):void {
        var _local2:ObjectHandler;
        for each (_local2 in this._handlers) {
            _local2.handle(_arg1);
        }
    }

}
}//package _03T_

import _qj._pn;

class ObjectHandler {

    /*private*/
    internal var _matcher:_pn;
    /*private*/
    internal var _handler:Function;

    public function ObjectHandler(_arg1:_pn, _arg2:Function) {
        this._matcher = _arg1;
        this._handler = _arg2;
    }

    public function handle(_arg1:Object):void {
        ((this._matcher.matches(_arg1)) && (this._handler(_arg1)));
    }

}

