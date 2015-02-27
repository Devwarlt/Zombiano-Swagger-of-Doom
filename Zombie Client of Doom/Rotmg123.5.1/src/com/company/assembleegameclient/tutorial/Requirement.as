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

//com.company.assembleegameclient.tutorial.Requirement

package com.company.assembleegameclient.tutorial {
import com.company.assembleegameclient.objects.ObjectLibrary;

public class Requirement {

    public var type_:String;
    public var _01U_:int = -1;
    public var objectType_:int = -1;
    public var _O_w:String = "";
    public var radius_:Number = 1;

    public function Requirement(_arg1:XML) {
        this.type_ = String(_arg1);
        var _local2:String = String(_arg1.@objectId);
        if (((!((_local2 == null))) && (!((_local2 == ""))))) {
            this.objectType_ = ObjectLibrary._pb[_local2];
        }
        this._O_w = String(_arg1.@objectName);
        if (this._O_w == null) {
            this._O_w = "";
        }
        this._01U_ = int(_arg1.@slot);
        this.radius_ = Number(_arg1.@radius);
    }
}
}//package com.company.assembleegameclient.tutorial

