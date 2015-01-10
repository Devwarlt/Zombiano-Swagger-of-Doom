/**
 * Created by Fabian on 08.01.2015.
 */
package com.company.assembleegameclient.game {
import _02t._pM_;

import com.company.assembleegameclient.map.Square;

import com.company.assembleegameclient.map._X_l;
import com.company.assembleegameclient.ui.MiniMap;

import flash.display.Sprite;
import flash.events.Event;

public class FoundVillageScreen extends Sprite {

    private var map:typeMap;
    private var minimap:MiniMap;

    public function FoundVillageScreen() {
        map = new typeMap();
        //map.setProps()
        map.scaleX = map.scaleY = 0.05;
        map.alpha = 0.5;
        map.x = 0;//400;
        map.y = 0;//300;
        map.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        addChild(map);
    }

    private function onAddedToStage(event:Event):void {
        minimap = new MiniMap(map.map, 300, 300);
        addChild(minimap);
        for each (var i:Square in map.map._8L_) {
            minimap.setGroundTile(i.x_, i.y_, i.tileType_);
        }

        for each (var i:Square in map.map._fr) {
            minimap.setGroundTile(i.x_, i.y_, i.tileType_);
        }
    }

    private function onEnterFrame(event:Event):void {
        this.minimap.draw();
    }
}
}

import FireBite.Embeds.Images.craftingBookEmbed;

import MapOverlays.MapOverlay;
import Sounds.Music;
import _02t._final;
import _K_D_._p0;

import com.company.assembleegameclient.map._0D_v;
import com.company.assembleegameclient.map._X_l;
import com.company.util.IntPoint;
import com.company.util._H_V_;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.geom.Rectangle;
import flash.utils.ByteArray;
import flash.utils.getTimer;

class typeMap extends Sprite {

    private static const BORDER:int = 10;
    private static var _R_m:Rectangle;// = new Rectangle(-400, -300, 800, 600);
    private static const _X_z:Number = ((7 * Math.PI) / 4);//5.49778714378214
    private static const _06B_:Number = (1 / 1000);//0.001
    private static const _01N_:Class = _final;

    public var map:_X_l;
    private static var _sl:IntPoint;
    private static var _jJ_:Number;
    private static var _U_b:Number;
    private static var _0F_q:_0D_v;

    private var _7n:int;
    private var time:Number;

    public function typeMap(){
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private function onAddedToStage(_arg1:Event):void{
        addChildAt((map = ((map) || (this._P_i()))), 0);
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
        this._7n = getTimer();
    }
    private function onRemovedFromStage(_arg1:Event):void{
        removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }
    private function onEnterFrame(_arg1:Event):void{
        this.time = getTimer();
        //_jJ_ = (_jJ_ + ((this.time - this._7n) * _06B_));
        //if (_jJ_ > (_sl.x_ + BORDER))
        //{
        //    _jJ_ = (_jJ_ - _sl.x_);
        //}
        //if (Sounds.Music.music_ != "Death" || Sounds.Music.music_ != "Menu") Sounds.Music.reload("Menu");
        //Sounds.Music.updateFade();
        if(_R_m) {
            drawAll();
            _0F_q._K_(_jJ_, _U_b, 12, 0, _R_m, false);
            map.draw(_0F_q, this.time);
        }
        this._7n = this.time;
    }
    private var drawed:Boolean = false;
    private function drawAll():void {
        if(!drawed) {
            for (var i:int = 0; i < _sl.x_; i++) {
                _0F_q._K_(i, _U_b, 12, _X_z, _R_m, true);
                map.draw(_0F_q, this.time);
            }
            drawed = true;
        }
    }

    private function _P_i():_X_l{
        var _local1:ByteArray = new _01N_();
        var _local2:String = _local1.readUTFBytes(_local1.length);
        _sl = _p0._0M_t(_local2);
        _jJ_ = BORDER;
        _U_b = (BORDER + int(((_sl.y_ - (2 * BORDER)) * Math.random())));
        _0F_q = new _0D_v();
        _0F_q._uo.fieldOfView = 179;
        var _local3:_X_l = new _X_l(null);
        var music:Vector.<String> = new Vector.<String>();
        _R_m = new Rectangle(0, 0, 10000, 10000);
        _local3.setProps(_sl.x_, _sl.y_, "MapOverlay Map", MapOverlay._0H_W_, false, false, music, 0, -1);
        _local3.initialize();
        _p0._T_6(_local2, _local3, 0, 0);
        _p0._T_6(_local2, _local3, _sl.x_, _sl.x_);
        return (_local3);
    }

    private function onKeyDown(event:KeyboardEvent):void {
        event.stopImmediatePropagation();

        if(event.keyCode == _H_V_.LEFT) {
            _jJ_--;
        }

        if(event.keyCode == _H_V_.RIGHT) {
            _jJ_++;
        }

        if(event.keyCode == _H_V_.UP) {
            _U_b--;
        }

        if(event.keyCode == _H_V_.DOWN) {
            _U_b++;
        }
    }
}
