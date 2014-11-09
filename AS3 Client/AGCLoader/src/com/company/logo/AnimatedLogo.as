// Decompiled by AS3 Sorcerer 2.72
// http://www.as3sorcerer.com/

//com.company.logo.AnimatedLogo

package com.company.logo{
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.events.Event;
    import flash.display.BitmapData;
    import flash.display.BitmapDataChannel;
    import flash.geom.ColorTransform;
    import flash.geom.Point;
    import flash.display.BlendMode;
    import com.company.rotmg.graphics.logo.Clouds;
    import com.company.rotmg.graphics.logo.Guy;
    import flash.utils.getTimer;

    public class AnimatedLogo extends Sprite {

        private static const PERIOD:int = 2000;

        private var background_:Bitmap;
        private var overlay_:Sprite;
        private var startTime_:int = -1;

        public function AnimatedLogo(){
            this.background_ = getBackground();
            this.overlay_ = getOverlay();
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        private static function getBackground():Bitmap{
            var _loc_1:BitmapData = new BitmapData(0x0100, 0x0100, false, 0xFF000000);
            var _loc_2:int = (Math.random() * int.MAX_VALUE);
            _loc_1.perlinNoise(_loc_1.width, _loc_1.height, 8, _loc_2, true, false, ((BitmapDataChannel.RED | BitmapDataChannel.GREEN) | BitmapDataChannel.BLUE), true, null);
            var _loc_3:ColorTransform = new ColorTransform(2, 2, 2, 1, 0, 0, 0, 0);
            _loc_1.colorTransform(_loc_1.rect, _loc_3);
            var _loc_4:BitmapData = new BitmapData((_loc_1.width * 2), _loc_1.height, false);
            _loc_4.copyPixels(_loc_1, _loc_1.rect, new Point(0, 0));
            _loc_4.copyPixels(_loc_1, _loc_1.rect, new Point(_loc_1.width, 0));
            _loc_1.dispose();
            return (new Bitmap(_loc_4));
        }
        private static function getOverlay():Sprite{
            var _loc_1:Sprite = new Sprite();
            _loc_1.blendMode = BlendMode.LAYER;
            _loc_1.addChild(new Clouds());
            var _loc_2:Guy = new Guy();
            _loc_2.x = _loc_1.width / 2 - _loc_2.width / 2;
            _loc_2.y = _loc_1.height / 2 - _loc_2.height / 2;
            _loc_2.blendMode = BlendMode.ERASE;
            _loc_1.addChild(_loc_2);
            _loc_1.x = 800 / 2 - _loc_1.width / 2;
            _loc_1.y = 600 / 2 - _loc_1.height / 2;
            _loc_1.blendMode = BlendMode.ERASE;
            var _loc_3:Sprite = new Sprite();
            _loc_3.blendMode = BlendMode.LAYER;
            _loc_3.graphics.beginFill(0, 1);
            _loc_3.graphics.drawRect(0, 0, 800, 600);
            _loc_3.graphics.endFill();
            _loc_3.addChild(_loc_1);
            return (_loc_3);
        }

        private function onAddedToStage(_arg_1:Event):void{
            addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
        private function onRemovedFromStage(_arg_1:Event):void{
            removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
        private function onEnterFrame(_arg_1:Event):void{
            this.moveBackground();
        }
        private function moveBackground():void{
            var _loc_1:int = getTimer();
            if (this.startTime_ == -1){
                this.startTime_ = _loc_1;
                addChild(this.background_);
                addChild(this.overlay_);
            };
            var _loc_2:Number = _loc_1 - this.startTime_ % PERIOD / PERIOD;
            this.background_.x = 0x0100 * _loc_2;
            this.background_.y = 600 / 2 - this.background_.height / 2;
        }

    }
}//package com.company.logo

