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

//OptionsStuff._N_9

package OptionsStuff{
import flash.display.Sprite;
import com.company.ui.SimpleText;
import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import com.company.util.Keys;
import flash.events.Event;
import flash.display.Graphics;
import flash.events.KeyboardEvent;
import flash.utils.getTimer;

public class _N_9 extends Sprite {

    public static const WIDTH:int = 80;
    public static const HEIGHT:int = 32;

    public var _0G_M_:uint;
    public var selected_:Boolean;
    public var _x7:Boolean;
    private var _04T_:SimpleText = null;

    public function _N_9(_arg1:uint){
        this._0G_M_ = _arg1;
        this.selected_ = false;
        this._x7 = false;
        this._04T_ = new SimpleText(16, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._04T_.boldText(true);
        this._04T_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        addChild(this._04T_);
        this._rC_();
        this._wb();
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }
    public function value():uint{
        return (this._0G_M_);
    }
    public function _09q(_arg1:uint):void{
        if (_arg1 == this._0G_M_)
        {
            return;
        }
        this._0G_M_ = _arg1;
        this._02C_(Keys.KeyNames[this._0G_M_]);
        dispatchEvent(new Event(Event.CHANGE, true));
    }
    private function _rC_():void{
        var _local1:Graphics = graphics;
        _local1.clear();
        _local1.lineStyle(2, ((((this.selected_) || (this._x7))) ? 0xB3B3B3 : 0x73543F));//0xB3B3B3 : 0x961700));
        _local1.beginFill(0x63432E);//0x681000
        _local1.drawRect(0, 0, WIDTH, HEIGHT);
        _local1.endFill();
        _local1.lineStyle();
    }
    private function onMouseOver(_arg1:MouseEvent):void{
        this.selected_ = true;
        this._rC_();
    }
    private function onRollOut(_arg1:MouseEvent):void{
        this.selected_ = false;
        this._rC_();
    }
    private function _02C_(_arg1:String):void{
        this._04T_.text = _arg1;
        this._04T_.updateMetrics();
        this._04T_.x = ((WIDTH / 2) - (this._04T_.width / 2));
        this._04T_.y = (((HEIGHT / 2) - (this._04T_.height / 2)) - 2);
        this._rC_();
    }
    private function _wb():void{
        this._x7 = false;
        removeEventListener(Event.ENTER_FRAME, this._gG_);
        if (stage != null)
        {
            removeEventListener(KeyboardEvent.KEY_DOWN, this._P_K_);
            stage.removeEventListener(MouseEvent.MOUSE_DOWN, this._00p, true);
        }
        this._02C_(Keys.KeyNames[this._0G_M_]);
        addEventListener(MouseEvent.CLICK, this._0B_f);
    }
    private function _yM_():void{
        if (stage == null)
        {
            return;
        }
        stage.stageFocusRect = false;
        stage.focus = this;
        this._x7 = true;
        removeEventListener(MouseEvent.CLICK, this._0B_f);
        addEventListener(Event.ENTER_FRAME, this._gG_);
        addEventListener(KeyboardEvent.KEY_DOWN, this._P_K_);
        stage.addEventListener(MouseEvent.MOUSE_DOWN, this._00p, true);
    }
    private function _0B_f(_arg1:MouseEvent):void{
        this._yM_();
    }
    private function _gG_(_arg1:Event):void{
        var _local2:int = (getTimer() / 400);
        this._02C_(((((_local2 % 2) == 0)) ? "" : "[Hit Key]"));
    }
    private function _P_K_(_arg1:KeyboardEvent):void{
        _arg1.stopImmediatePropagation();
        this._0G_M_ = _arg1.keyCode;
        this._wb();
        dispatchEvent(new Event(Event.CHANGE, true));
    }
    private function _00p(_arg1:MouseEvent):void{
        this._wb();
    }

}
}//package OptionsStuff

