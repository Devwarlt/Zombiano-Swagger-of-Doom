// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Effects._I_b

package Effects {
    import com.company.assembleegameclient.objects.GameObject;

    import flash.display.IGraphicsData;
    import com.company.assembleegameclient.map._0D_v;

    public class Effect extends GameObject {

        public function Effect(){
            super(null);
            objectId_ = _7y();
            _P_m = false;
        }
        public static function resolve(_arg1:_D_J_, _arg2:GameObject):Effect{
            switch (_arg1.id)
            {
                case "Healing":
                    return (new HealingEffect(_arg2));
                case "Fountain":
                    return (new FountainEffect(_arg2));
                case "Gas":
                    return (new GasEffect(_arg2, _arg1));
                case "Vent":
                    return (new VentEffect(_arg2));
                case "Bubbles":
                    return (new BubbleEffect(_arg2, _arg1));
                case "XMLEffect":
                    return (new XMLEffect(_arg2, _arg1));
                case "CustomParticles":
                    return (ParticleEffect.create(_arg1, _arg2));
                case "CloudParticles":
                    var eff:ParticleEffect = ParticleEffect.create(_arg1, _arg2);
                    eff.cloud_ = true;
                    return eff;
            }
            return (null);
        }

        override public function update(_arg1:int, _arg2:int):Boolean{
            return (false);
        }
        override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void{
        }

    }
}//package Effects

