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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map.Quest

package com.company.assembleegameclient.map {
import flash.utils.getTimer;

import com.company.assembleegameclient.objects.GameObject;

public class Quest {

    public var map_:GameMap;
    public var objectId_:int = -1;
    private var _F_2:int = 0;
    private var _vx:int = 0;

    public function Quest(_arg1:GameMap) {
        this.map_ = _arg1;
    }

    public function setObject(_arg1:int):void {
        if ((((this.objectId_ == -1)) && (!((_arg1 == -1))))) {
            this._F_2 = (getTimer() + 4000);
            this._vx = (this._F_2 + 2000);
        }
        this.objectId_ = _arg1;
    }

    public function completed():void {
        this._F_2 = ((getTimer() + 15000) - (Math.random() * 10000));
        this._vx = (this._F_2 + 2000);
    }

    public function getObject(_arg1:int):GameObject {
        if (_arg1 < this._F_2) {
            return (null);
        }
        return (this.map_.goDict_[this.objectId_]);
    }

    public function isNew(_arg1:int):Boolean {
        return ((_arg1 < this._vx));
    }

}
}//package com.company.assembleegameclient.map

