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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

/**
 * Created by Fabian on 08.01.2015.
 */
package com.company.assembleegameclient.game {
import _02t._final;
import _02t._pM_;

import _K_D_._p0;

import com.company.assembleegameclient.map.Square;

import com.company.assembleegameclient.map._X_l;
import com.company.assembleegameclient.ui.MiniMap;
import com.company.util.Keys;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.geom.Point;
import flash.utils.ByteArray;

public class FoundVillageScreen extends Sprite {

    private var realMap:_X_l;
    private var minimap:MiniMap;
    private var mapPoint:Point;

    [Embed(source="gameworld.jm", mimeType="application/octet-stream")]
    private static var _map:Class;

    public function FoundVillageScreen() {
        this.realMap = new _X_l(null);
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onAddedToStage(event:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
        var _local1:ByteArray = new _map();
        var _local2:String = _local1.readUTFBytes(_local1.length);
        var mapData:Object = _p0.loadMapWithMiniMap(_local2, 300, 300);
        this.realMap = mapData["RealMap"];
        this.minimap = mapData["MiniMap"];
        this.minimap.alpha = 1.0;
        addChild(this.minimap);
        this.mapPoint = new Point(this.realMap.width_ / 2, this.realMap.height_ / 2);
    }

    private function onEnterFrame(event:Event):void {
        this.minimap.draw(this.mapPoint);
    }

    private function onKeyDown(event:KeyboardEvent):void {
        if(event.keyCode == Keys.LEFT) {
            this.mapPoint.x--;
        }

        if(event.keyCode == Keys.RIGHT) {
            this.mapPoint.x++;
        }

        if(event.keyCode == Keys.UP) {
            this.mapPoint.y--;
        }

        if(event.keyCode == Keys.DOWN) {
            this.mapPoint.y++;
        }
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
import com.company.util.Keys;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.geom.Point;
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

    private var point:Point;

    public function typeMap() {
        point = new Point();
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
            //drawAll();
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
        return _p0._0L_k(_local2);
    }

    private function onKeyDown(event:KeyboardEvent):void {
        event.stopImmediatePropagation();


    }
}
