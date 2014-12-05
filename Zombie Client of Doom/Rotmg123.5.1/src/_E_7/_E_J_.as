// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7._E_J_

package _E_7{
    import flash.display.Bitmap;
    import com.company.ui.SimpleText;
    import com.company.assembleegameclient.ui._return;
    import com.company.assembleegameclient.util._0B_c;
    import com.company.assembleegameclient.util._lJ_;
    import com.company.assembleegameclient.util._J_H_;
    import com.company.assembleegameclient.util.TextureRedrawer;
    import flash.display.BitmapData;
    import com.company.util._G_;
    import flash.geom.ColorTransform;
    import flash.filters.DropShadowFilter;
    import com.company.assembleegameclient.util.RankUtils;
    import com.company.assembleegameclient.objects.ObjectLibrary;
    import com.company.assembleegameclient.appengine._0K_R_;
    import com.company.assembleegameclient.appengine._0A_H_;

    public class _E_J_ extends _for_ {

        private var _tm:Bitmap;
        private var nameText_:SimpleText;
        private var description:SimpleText;
        private var spacer:_return;
        private var specialEffect:SimpleText;
        private var _nr:SimpleText;
        private var unlockText:SimpleText;
        private var _U_n:SimpleText;

        public function _E_J_(_arg1:XML, _arg2:_0K_R_){
            var _local9:int;
            var _local10:int;
            var _local11:XML;
            var _local12:int;
            var _local13:int;
            super(0x500C00, 1, 0xFFFFFF, 1);
            var _local4:_lJ_ = _0B_c._J_v(String(_arg1.AnimatedTexture.File), int(_arg1.AnimatedTexture.Index));
            var _local5:_J_H_ = _local4.imageFromDir(_lJ_.RIGHT, _lJ_._sS_, 0);
            var _local6:int = ((4 / _local5.width()) * 100);
            var _local7:BitmapData = TextureRedrawer.redraw(_local5.image_, _local6, true, 0, 0);
            var _local8:Boolean = isAvailable(_arg1, _arg2);
            if (!_local8)
            {
                _local7 = _G_._B_2(_local7, new ColorTransform(0, 0, 0, 0.5, 0, 0, 0, 0));
            }
            this._tm = new Bitmap();
            this._tm.bitmapData = _local7;
            this._tm.x = -4;
            this._tm.y = -4;
            addChild(this._tm);
            this.nameText_ = new SimpleText(13, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this.nameText_.boldText(true);
            this.nameText_.text = _arg1.@id;
            this.nameText_.updateMetrics();
            this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
            this.nameText_.x = 32;
            this.nameText_.y = 6;
            addChild(this.nameText_);
            this.description = new SimpleText(13, 0xB3B3B3, false, 174, 0, "Myriad Pro");
            this.description.wordWrap = true;
            this.description.multiline = true;
            this.description.text = _arg1.Description;
            this.description.updateMetrics();
            this.description.filters = [new DropShadowFilter(0, 0, 0)];
            this.description.x = 8;
            this.description.y = 40;
            addChild(this.description);
            this.spacer = new _return(100, 0x310800);
            this.spacer.x = 6;
            this.spacer.y = height;
            addChild(this.spacer);
            if (_local8)
            {
                this._U_n = new SimpleText(14, 6206769, false, 0, 0, "Myriad Pro");
                this._U_n.text = "HI MAX";
                this._U_n.updateMetrics();
                this._U_n.filters = [new DropShadowFilter(0, 0, 0)];
                this._U_n.x = 8;
                this._U_n.y = (height - 2);
                addChild(this._U_n);

                //_local9 = (((_arg3 == null)) ? 0 : _arg3._lr());
                //this._05h = new SimpleText(14, 6206769, false, 0, 0, "Myriad Pro");
                //this._05h.text = ((((((_local9 + " of 5 Class Quests Completed\n") + "Best Level Achieved: ") + (((_arg3)!=null) ? _arg3._bI_() : 0)) + "\n") + "Best Fame Achieved: ") + (((_arg3)!=null) ? _arg3._0D_E_() : 0));
                //this._05h.updateMetrics();
                //this._05h.filters = [new DropShadowFilter(0, 0, 0)];
                //this._05h.x = 8;
                //this._05h.y = (height - 2);
                //addChild(this._05h);
                //_local10 = RankUtils._F_U_((((_arg3 == null)) ? 0 : _arg3._0D_E_()), 0);
                //if (_local10 > 0)
                //{
                //    this._U_n = new SimpleText(13, 16549442, false, 174, 0, "Myriad Pro");
                //    this._U_n.text = (((("Next Goal: Earn " + _local10) + " Fame\n") + "  with a ") + _arg1.@id);
                //    this._U_n.updateMetrics();
                //    this._U_n.filters = [new DropShadowFilter(0, 0, 0)];
                //    this._U_n.x = 8;
                //    this._U_n.y = (height - 2);
                //    addChild(this._U_n);
                //}
            }
            else
            {
                this.unlockText = new SimpleText(13, 0xB3B3B3, false, 174, 0, "Myriad Pro");
                this.unlockText.boldText(true);
                this.unlockText.text = "To Unlock:";
                this.unlockText.updateMetrics();
                this.unlockText.filters = [new DropShadowFilter(0, 0, 0)];
                this.unlockText.x = 8;
                this.unlockText.y = (height - 2);
                addChild(this.unlockText);
                this.unlockText = new SimpleText(13, 16549442, false, 174, 0, "Myriad Pro");
                this.unlockText.wordWrap = false;
                this.unlockText.multiline = true;
                var text:String = "";
                for each (var item:XML in _arg1.Unlock)
                {
                    if (item.hasOwnProperty("Rank")) {
                        text += "Rank required:\n" + RankUtils.toLongRankString(item.Rank) + "\n\n";
                    }

                    if (item.hasOwnProperty("InGameDrop")) {
                        text += "Find skin in game as drop.\n\n";
                    }

                    if (item.hasOwnProperty("InGameReward")) {
                        text += "Reward:\n" + item.InGameReward + "\n\n";
                    }
                }
                this.unlockText.text = text.slice(0, text.lastIndexOf("\n\n"));
                this.unlockText.border = false;
                this.unlockText.updateMetrics();
                this.unlockText.filters = [new DropShadowFilter(0, 0, 0)];
                this.unlockText.x = 12;
                this.unlockText.y = (height - 4);
                addChild(this.unlockText);
            }
        }
        override public function draw():void{
            this.spacer._rs((width - 10), 0x310800);
            super.draw();
        }

        public static function isAvailable(skin:XML, charList:_0K_R_):Boolean {
            if(charList.ownedSkins.indexOf(skin.@type) > -1) return true;

            for each (var item:XML in skin.Unlock) {
                var tret:Boolean = true;
                if (item.hasOwnProperty("Rank")) {
                    tret = (charList.rank >= item.Rank);
                }

                if(!tret) {
                    return false;
                }
            }
            return true;
        }
    }
}//package _E_7

