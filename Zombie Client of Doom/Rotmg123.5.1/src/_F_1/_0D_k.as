// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._0D_k

package _F_1{
    import flash.display.Sprite;
    import com.company.ui.SimpleText;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;
    import com.company.assembleegameclient.net.Server;

    public class _0D_k extends Sprite {

        public static const WIDTH:int = 384;
        public static const HEIGHT:int = 52;

        public var value_:String;
        private var nameText_:SimpleText;
        private var _L_B_:SimpleText;
        private var selected_:Boolean = false;
        private var over_:Boolean = false;

        private var protocolType:SimpleText;

        public function _0D_k(_arg1:Server){
            var _local2:uint;
            var _local3:String;
            super();
            this.value_ = (((_arg1 == null)) ? null : _arg1.name_);
            this.nameText_ = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            this.nameText_.boldText(true);
            this.nameText_.text = (((_arg1 == null)) ? "Best Server" : _arg1.name_);
            this.nameText_.updateMetrics();
            this.nameText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
            this.nameText_.x = 18;
            this.nameText_.y = ((_0D_k.HEIGHT / 2) - (this.nameText_.height / 2));
            addChild(this.nameText_);
            if (_arg1 != null)
            {
                _local2 = 0xFF00;
                _local3 = "Normal";
                if (_arg1._02s())
                {
                    _local2 = 0xFF0000;
                    _local3 = "Full";
                } else
                {
                    if (_arg1._0J_m())
                    {
                        _local2 = 16549442;
                        _local3 = "Crowded";
                    }
                }
                this._L_B_ = new SimpleText(18, _local2, false, 0, 0, "Myriad Pro");
                this._L_B_.boldText(true);
                this._L_B_.text = _local3;
                this._L_B_.updateMetrics();
                this._L_B_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
                this._L_B_.x = ((WIDTH / 2) + ((WIDTH / 4) - (this._L_B_.width / 2)));
                this._L_B_.y = ((_0D_k.HEIGHT / 2) - (this.nameText_.height / 2));
                addChild(this._L_B_);

                this.protocolType = new SimpleText(20, _arg1.isUDP ? 0xff0000 : 0x27FF00, false, 0, 0, "Myriad Pro");
                this.protocolType.boldText(true);
                this.protocolType.text = _arg1.isUDP ? "UDP" : "TCP";
                this.protocolType.updateMetrics();
                this.protocolType.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
                this.protocolType.x = WIDTH - this.protocolType.width - 10;
                this.protocolType.y = ((HEIGHT / 2) - (this.protocolType.height / 2));
                addChild(this.protocolType);
            }
            this.draw();
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        }
        public function setSelected(_arg1:Boolean):void{
            this.selected_ = _arg1;
            this.draw();
        }
        private function onMouseOver(_arg1:MouseEvent):void{
            this.over_ = true;
            _01_.setProtocolInfo(this.protocolType == null ? null : new ProtocolInfo(this.protocolType.text == "UDP"));
            this.draw();
        }
        private function onRollOut(_arg1:MouseEvent):void{
            this.over_ = false;
            _01_.setProtocolInfo(null);
            this.draw();
        }
        private function draw():void{
            graphics.clear();
            if (this.selected_)
            {
                graphics.lineStyle(2, 0xE5C100);
            }
            graphics.beginFill(((this.over_) ? 0x292929 : 0x000000), 1);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            if (this.selected_)
            {
                graphics.lineStyle();
            }
        }
    }
}

import com.company.ui.SimpleText;

import flash.display.Sprite;

class ProtocolInfo extends Sprite {

    private var title:SimpleText;
    private var desc:SimpleText;

    public function ProtocolInfo(isUDP:Boolean) {
        graphics.beginFill(0, 1.0);
        graphics.drawRect(0, 0, 800, 100);
        graphics.endFill();

        this.title = new SimpleText(20, isUDP ? 0xff0000 : 0x27FF00);
        this.title.text = isUDP ? "User Datagram Protocol (UDP) (Not fully finished on the server)" : "Transmission Control Protocol (TCP)";
        this.title.x = 10;
        this.title.y = 5;
        this.title.boldText(true);
        this.title.updateMetrics();
        addChild(this.title);

        this.desc = new SimpleText(13, 0xffffff, false, 70, 780);
        this.desc.multiline = true;
        this.desc.wordWrap = true;
        this.desc.x = 10;
        this.desc.y = 30;
        this.desc.text = getText(isUDP);
        addChild(this.desc);
    }

    private function getText(isUdp:Boolean):String {
        if(isUdp)
            return "UDP uses a simple connectionless transmission model with a minimum of protocol mechanism. It has no handshaking dialogues, and thus exposes any unreliability of the underlying network protocol to the user's program. There is no guarantee of delivery, ordering, or duplicate protection. UDP provides checksums for data integrity, and port numbers for addressing different functions at the source and destination of the datagram.";
        return "The Transmission Control Protocol (TCP) is one of the core protocols of the Internet protocol suite (IP), and is so common that the entire suite is often called TCP/IP. TCP provides reliable, ordered and error-checked delivery of a stream of octets between programs running on computers connected to a local area network, intranet or the public Internet. It resides at the transport layer.";
    }
}

