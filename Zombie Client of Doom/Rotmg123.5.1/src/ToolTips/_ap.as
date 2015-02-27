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

//ToolTips._ap

package ToolTips {
import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui._gV_;

import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.objects.GameObject;

public class _ap extends ToolTip {

    private var text_:SimpleText;
    public var _id:_gV_;

    public function _ap(_arg1:GameObject) {
        super(6036765, 1, 16549442, 1, false);
        this.text_ = new SimpleText(22, 16549442, false, 0, 0, "Myriad Pro");
        this.text_.boldText(true);
        this.text_.text = "Quest!";
        this.text_.updateMetrics();
        this.text_.filters = [new DropShadowFilter(0, 0, 0)];
        this.text_.x = 0;
        this.text_.y = 0;
        addChild(this.text_);
        this._id = new _gV_(0xB3B3B3, true, _arg1);
        this._id.x = 0;
        this._id.y = 32;
        addChild(this._id);
        filters = [];
    }
}
}//package ToolTips

