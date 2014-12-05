// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._0H_2

package _F_1{
    import _02t._R_f;
    
    import _sp._aJ_;
    
    import com.company.assembleegameclient.appengine._0K_R_;
    import com.company.assembleegameclient.objects.ObjectLibrary;
    import com.company.assembleegameclient.ui._0B_v;
import com.company.assembleegameclient.ui.boxButton;
import com.company.assembleegameclient.util.tutorialObjects;
import com.company.googleanalytics.GA;
    import com.company.rotmg.graphics.ScreenGraphic;
import com.company.ui.SimpleText;

import flash.events.Event;
    import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.text.TextFieldAutoSize;

public class _0H_2 extends _05p {

        private var _p6:_H_o;
        private var _H_t:_0B_v;
        private var _break:Object;
        public var close:_aJ_;
        public var play:_aJ_;

        public function _0H_2(){
            this._break = {};
            addChild(new _R_f());
            super(CurrentCharacterScreen);
            this.play = new _aJ_(int);
            this.close = new _aJ_();
        }
        override public function initialize(_arg1:_0K_R_):void{
            var _local3:XML;
            var _local4:int;
            var _local5:CharacterBox;
            super.initialize(_arg1);
            addChild(new ScreenGraphic());
            this._p6 = new _H_o("back", 36, false);
            this._p6.addEventListener(MouseEvent.CLICK, this._0K_0);
            addChild(this._p6);
            this._H_t = new _0B_v();
            this._H_t.draw(_arg1.credits_, _arg1._Q_7);
            addChild(this._H_t);

            var title:SimpleText = new SimpleText(36, 0xffffff, false, 800, 600);
            title.text = "Select a skin.";
            title.x = 400 - (title.textWidth / 2);
            title.y = 10;
            title.filters = [new DropShadowFilter()];
            addChild(title);

            var noSkin:boxButton = new boxButton(20, "No skin");
            noSkin.x = (400) - (noSkin.width / 2);
            noSkin.y = 65;
            noSkin.addEventListener(MouseEvent.CLICK, this.playWithNoSkin);
            addChild(noSkin);

            var _local2:int = 0;
            while (_local2 < ObjectLibrary.skins.length)
            {
                _local3 = ObjectLibrary.skins[_local2];
                _local4 = int(_local3.@type);
                _local5 = new CharacterBox(_local3, _arg1.charStats_[_local4], _arg1);
                _local5.x = (((50 + (140 * int((_local2 % 5)))) + 70) - (_local5.width / 2));
                _local5.y = (110 + (140 * int((_local2 / 5))));
                this._break[_local4] = _local5;
                _local5.addEventListener(MouseEvent.ROLL_OVER, this._O_y);
				_local5.addEventListener(Event.ENTER_FRAME, this.spinEvent);
				_local5.addEventListener(Event.REMOVED_FROM_STAGE, this.remSpinEvent);
                _local5.addEventListener(MouseEvent.ROLL_OUT, this._02F_);
                if (_arg1.hasAvailableCharSlot())
                {
                    _local5.addEventListener(MouseEvent.CLICK, this._X_);
                }
                addChild(_local5);
                _local2++;
            }
            this._p6.x = ((800 / 2) - (this._p6.width / 2));
            this._p6.y = 524;
            this._H_t.x = 800;
            this._H_t.y = 20;
            GA.global().trackPageview("/newCharScreen");
        }
        private function _0K_0(_arg1:Event):void{
            this.close.dispatch();
        }
		public function spinEvent(_arg1:Event):void{
			(_arg1.currentTarget as CharacterBox).tryUpdateSpin();
		}
		public function remSpinEvent(_arg1:Event):void{
			(_arg1.currentTarget as CharacterBox).removeEventListener(Event.ENTER_FRAME, this.spinEvent);
		}
        private function _O_y(_arg1:MouseEvent):void{
            var _local2:CharacterBox = (_arg1.currentTarget as CharacterBox);
            _local2._P_Y_(true);
			_local2.selectedOver = true;
            tooltip.dispatch(_local2.getTooltip());
        }
        private function _02F_(_arg1:MouseEvent):void{
            var _local2:CharacterBox = (_arg1.currentTarget as CharacterBox);
            _local2._P_Y_(false);
			_local2.selectedOver = false;
            tooltip.dispatch(null);
        }
        private function _X_(_arg1:MouseEvent):void{
            tooltip.dispatch(null);
            var _local2:CharacterBox = (_arg1.currentTarget as CharacterBox);
            if (!_local2._F_I_)
            {
                return;
            }
            var _local3:int = _local2.skinType();
            var _local4:String = ObjectLibrary._0D_N_[_local3];
            GA.global().trackEvent("character", "create", _local4);
            this.play.dispatch(_local3);
        }

        private function playWithNoSkin(_arg1:MouseEvent):void{
            tooltip.dispatch(null);
            var _local3:int = -1;
            var _local4:String = ObjectLibrary._0D_N_[_local3];
            GA.global().trackEvent("character", "create", _local4);
            this.play.dispatch(_local3);
        }
    }
}//package _F_1

