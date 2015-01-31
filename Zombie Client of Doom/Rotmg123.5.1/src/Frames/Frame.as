// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Frames.Frame

package Frames{
import flash.display.Sprite;

import flash.display.IGraphicsData;
import com.company.util.GraphicHelper;
import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui.TextButton;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.filters.DropShadowFilter;
import flash.events.Event;
import flash.display.DisplayObject;


public class Frame extends Sprite {

    private var graphicsData_:Vector.<IGraphicsData>;

    public var _P_V_:SimpleText;
    public var Button1:TextButton;
    public var Button2:TextButton;
    public var _Q_r:Vector.<TextInput>;
    public var _Z_Y_:Vector.<TextButton>;
    protected var w_:int = 288;
    protected var h_:int = 100;
    private var _O_n:GraphicsSolidFill;
    private var _vV_:GraphicsSolidFill;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var path1_:GraphicsPath;
    private var path2_:GraphicsPath;

    public function Frame(_arg1:String, _arg2:String, _arg3:String, _arg4:int=288){
        this._Q_r = new Vector.<TextInput>();
        this._Z_Y_ = new Vector.<TextButton>();
        this._O_n = new GraphicsSolidFill(0x73543F, 1);
        this._vV_ = new GraphicsSolidFill(0x6B472E, 1);
        //this._O_n = new GraphicsSolidFill(0x610F00, 1);
        //this._vV_ = new GraphicsSolidFill(0x3F0A00, 1);
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this.path1_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.path2_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_vV_, path2_, GraphicHelper.END_FILL, _O_n, path1_, GraphicHelper.END_FILL, _0y, path2_, GraphicHelper._H_B_];
        super();
        this.w_ = _arg4;
        this._P_V_ = new SimpleText(16, 0x000000, false, 0, 0, "Myriad Pro");
        this._P_V_.boldText(true);
        this._P_V_.text = _arg1;
        this._P_V_.updateMetrics();
        //this._P_V_.filters = [new DropShadowFilter(0, 0, 0)];
        this._P_V_.x = 5;
        //this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];


        addChild(this._P_V_);
        this.Button1 = new TextButton(18, true, _arg2);
        if (_arg2 != "")
        {
            this.Button1.buttonMode = true;
            this.Button1.x = 109;
            addChild(this.Button1);
        }
        this.Button2 = new TextButton(18, true, _arg3);
        this.Button2.buttonMode = true;
        this.Button2.x = ((this.w_ - this.Button2.width) - 26);
        addChild(this.Button2);
        filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public function addTextInput(_arg1:TextInput):void{
        this._Q_r.push(_arg1);
        addChild(_arg1);
        _arg1.y = (this.h_ - 60);
        _arg1.x = 17;
        this.h_ = (this.h_ + TextInput.HEIGHT);
    }
    public function addTextButton(_arg1:TextButton):void{
        this._Z_Y_.push(_arg1);
        addChild(_arg1);
        _arg1.y = (this.h_ - 66);
        _arg1.x = 17;
        this.h_ = (this.h_ + 20);
    }
    public function _W_z(_arg1:DisplayObject, _arg2:int=8):void{
        addChild(_arg1);
        _arg1.y = (this.h_ - 66);
        _arg1.x = _arg2;
        this.h_ = (this.h_ + _arg1.height);
    }
    public function addTextLine(_arg1:String):void{
        var _local2:SimpleText;
        _local2 = new SimpleText(12, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        _local2.text = _arg1;
        _local2.updateMetrics();
        _local2.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(_local2);
        _local2.y = (this.h_ - 66);
        _local2.x = 17;
        this.h_ = (this.h_ + 20);
    }
    public function _0D_6(_arg1:String):void{
        var _local2:SimpleText = new SimpleText(20, 0xB2B2B2, false, 0, 0, "Myriad Pro");
        _local2.text = _arg1;
        _local2.boldText(true);
        _local2.updateMetrics();
        _local2.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        addChild(_local2);
        _local2.y = (this.h_ - 60);
        _local2.x = 15;
        this.h_ = (this.h_ + 40);
    }
    public function _O_1(_arg1:_zb):void{
        addChild(_arg1);
        _arg1.y = (this.h_ - 66);
        _arg1.x = 17;
        this.h_ = (this.h_ + 44);
    }
    public function _mi(_arg1:_mo):void{
        addChild(_arg1);
        _arg1.y = (this.h_ - 66);
        _arg1.x = 18;
        this.h_ = (this.h_ + _arg1.height);
    }
    public function _0E_n(_arg1:int):void{
        this.h_ = (this.h_ + _arg1);
    }
    public function lockButtons():void{
        var _local1:TextButton;
        mouseEnabled = false;
        mouseChildren = false;
        for each (_local1 in this._Z_Y_)
        {
            _local1._02W_(0xB3B3B3);
        }
        this.Button1._02W_(0xB3B3B3);
        this.Button2._02W_(0xB3B3B3);
    }
    public function releaseButtons():void{
        var _local1:TextInput;
        var _local2:TextButton;
        mouseEnabled = true;
        mouseChildren = true;
        for each (_local1 in this._Q_r)
        {
        }
        for each (var _local5 in this._Z_Y_)
        {
            _local2 = _local5;
            _local2._02W_(0xFFFFFF);
        }
        this.Button1._02W_(0xFFFFFF);
        this.Button2._02W_(0xFFFFFF);
    }
    public function onAddedToStage(_arg1:Event):void{
        this.draw();
        stage;
        (x = ((800 / 2) - ((this.w_ - 6) / 2)));
        stage;
        (y = ((600 / 2) - (height / 2)));
        if (this._Q_r.length > 0)
        {
            (stage.focus = this._Q_r[0].inputText_);
        }
    }

    public override function get height():Number {
        return this.h_;
    }

    private function onRemovedFromStage(_arg1:Event):void{
    }
    public function draw():void{
        this.graphics.clear();

        this.graphics.beginFill(0x000000, 1.0);
        this.graphics.drawRect(0, 0, this.w_, this.h_);
        this.graphics.endFill();

        this.graphics.beginFill(0xffffff, 1.0);
        this.graphics.drawRect(0, 0, this.w_, (20 + 12));
        this.graphics.endFill();

        GraphicHelper.createBorder(this, 1, 0xffffff);

        (this.Button1.y = (this.h_ - 48));
        (this.Button2.y = (this.h_ - 48));
        this.graphics.drawGraphicsData(this.graphicsData_);
    }

}
}//package Frames

