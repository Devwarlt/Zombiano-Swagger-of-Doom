// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.Character

package com.company.assembleegameclient.objects{
    import Sounds.SoundEffects;


    public class Character extends GameObject {

        public var _07K_:int = 0;
        public var damageType_:uint = 0;
        public var _06w:String;
        public var _0L_g:String;

        public function Character(_arg1:XML){
            super(_arg1);
            this._06w = ((_arg1.hasOwnProperty("HitSound")) ? String(_arg1.HitSound) : "monster/default_hit");
            SoundEffects.load(this._06w);
            this._0L_g = ((_arg1.hasOwnProperty("DeathSound")) ? String(_arg1.DeathSound) : "monster/default_death");
            SoundEffects.load(this._0L_g);
        }
        override public function damage(_arg1:int, _arg2:int, _arg3:Vector.<uint>, _arg4:Boolean, _arg5:Projectile):void{
            super.damage(_arg1, _arg2, _arg3, _arg4, _arg5);
            if (_aE_)
            {
                SoundEffects.play(this._0L_g);
            } else
            {
                SoundEffects.play(this._06w);
            }
        }

    }
}//package com.company.assembleegameclient.objects

