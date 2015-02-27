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

//ToolTips._0M_k

package ToolTips {
import com.company.assembleegameclient.appengine.SavedCharsList;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.ui._gV_;
import com.company.assembleegameclient.ui._0M_Y_;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.ui._return;
import com.company.assembleegameclient.objects.ObjectLibrary;

public class _0M_k extends ToolTip {

    public var player_:Player;
    private var _02y:_gV_;
    private var _023:_0M_Y_;
    private var _F_C_:_0M_Y_;
    private var _e9:Inventory;
    private var _qc:_return;

    public function _0M_k(_arg1:String, _arg2:XML, _arg3:SavedCharsList) {
        super(0x471D00, 1, 0xFFFFFF, 1);
        var _local4:int = int(_arg2.ObjectType);
        var _local5:XML = ObjectLibrary.Items[_local4];
        this.player_ = Player._D_U_(_arg1, _arg2);
        this.player_.rank = _arg3.rank;
        this._02y = new _gV_(0xB3B3B3, true, this.player_);
        addChild(this._02y);
        this._023 = new _0M_Y_(176, 16, 14693428, 0x260400, "Health");
        this._023.x = 6;
        this._023.y = 45;
        addChild(this._023);
        this._F_C_ = new _0M_Y_(176, 16, 0x421111, 0x260400, "Hunger");
        this._F_C_.x = 6;
        this._F_C_.y = 69;
        addChild(this._F_C_);
        this._e9 = new Inventory(null, this.player_, "Player Inventory", this.player_._9A_, 12, false);
        this._e9.x = 8;
        this._e9.y = 93;
        addChild(this._e9);
        this._qc = new _return(90, 0x310800);
        this._qc.x = 6;
        this._qc.y = 233;
        addChild(this._qc);
    }

    override public function draw():void {
        this._023.draw(this.player_.HP_, this.player_.maxHP_, this.player_._P_7, this.player_._uR_);
        this._F_C_.draw(this.player_.MP_, this.player_.maxMP_, this.player_._0D_G_, this.player_._dt);
        this._e9.draw(this.player_.equipment_);
        this._qc._rs((width - 10), 0x310800);
        super.draw();
    }

}
}//package ToolTips

