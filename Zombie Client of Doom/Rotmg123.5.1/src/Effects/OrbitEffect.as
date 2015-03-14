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

/**
 * Created by Fabian on 08.03.2015.
 */
package Effects {
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.util.AssetLibrary;

import flash.display.BitmapData;

public class OrbitEffect extends Effect {

    public static function createEffect(_arg1:_D_J_, _arg2:GameObject):OrbitEffect {
        return (new OrbitEffect(_arg1, _arg2));
    }

    public function OrbitEffect(_arg1:_D_J_, _arg2:GameObject) {
        this._J_7 = _arg2;
        this._0G_x = _arg1;
        this.angle_ = this._0G_x.angleOffset;
        if (this._0G_x.bitmapFile) {
            this.bitmapData = AssetLibrary._xK_(this._0G_x.bitmapFile, this._0G_x.bitmapIndex);
            this.bitmapData = TextureRedrawer.redraw(this.bitmapData, this._0G_x.size, true, 0, 0);
        } else {
            this.bitmapData = TextureRedrawer.redrawSolidSquare(this._0G_x.color, this._0G_x.size);
        }
    }
    private var particle_:_7M_;
    private var _J_7:GameObject;
    private var angle_:Number = 0;
    private var _ge:Number = 0;
    private var _0G_x:_D_J_;
    private var bitmapData:BitmapData;

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local3:Number = (_arg1 / 1000);
        var _local4:Number = (_arg2 / 1000);
        if (this._J_7.map_ == null) {
            return (false);
        }
        x_ = this._J_7.x_;
        y_ = this._J_7.y_;
        z_ = (this._J_7.z_ + this._0G_x.zOffset);
        this._ge = (this._ge + _local4);
        if(this.particle_ == null) {
            this.particle_ = new _7M_(this.bitmapData);
            this.particle_.lX_ = 0;
            this.particle_.lY_ = 0;
            map_.addObj(this.particle_, x_, y_);
            this.particle_.z_ = this._0G_x.zOffset;
        }
        this.angle_ += this._0G_x.speed * _local4;
        this.angle_ = this.angle_ % 360;
        this.particle_.lX_ = this._0G_x.radius * Math.cos(this.angle_ * Math.PI / 180);
        this.particle_.lY_ = -this._0G_x.radius * Math.sin(this.angle_ * Math.PI / 180);
        this.particle_.x_ = this.x_ + this.particle_.lX_;
        this.particle_.y_ = this.y_ + this.particle_.lY_;
        this.particle_._0H_B_ = map_.getSquare(this.particle_.x_, this.particle_.y_);
        return (true);
    }

    override public function removeFromMap():void {
        if(this.particle_ != null) {
            map_.removeObj(this.particle_.objectId_);
        }
        super.removeFromMap();
    }

}
}
