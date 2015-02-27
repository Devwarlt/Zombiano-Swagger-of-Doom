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

//com.company.assembleegameclient.tutorial.Step

package com.company.assembleegameclient.tutorial {


public class Step {

    public var text_:String;
    public var action_:String;
    public var _0J_b:Vector.<UIDrawBox>;
    public var _06F_:Vector.<UIDrawArrow>;
    public var _I_2:Vector.<Requirement>;
    public var _n:int = 0;

    public function Step(_arg1:XML) {
        var _local2:XML;
        var _local3:XML;
        var _local4:XML;
        this._0J_b = new Vector.<UIDrawBox>();
        this._06F_ = new Vector.<UIDrawArrow>();
        this._I_2 = new Vector.<Requirement>();
        super();
        for each (_local2 in _arg1.UIDrawBox) {
            this._0J_b.push(new UIDrawBox(_local2));
        }
        for each (_local3 in _arg1.UIDrawArrow) {
            this._06F_.push(new UIDrawArrow(_local3));
        }
        for each (_local4 in _arg1.Requirement) {
            this._I_2.push(new Requirement(_local4));
        }
    }

    public function toString():String {
        return ((("[" + this.text_) + "]"));
    }

}
}//package com.company.assembleegameclient.tutorial

