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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

package com.company.assembleegameclient.map {
import MapOverlays.Weather;

import _015._0C_Q_;

import MapOverlays.MapOverlay;

import _fh._zh;

import Sounds.Music;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.BasicObject;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.objects._ez;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.ConditionEffect;

import flash.display.Graphics;
import flash.display.IGraphicsData;
import flash.display.Sprite;
import flash.filters.BlurFilter;
import flash.filters.ColorMatrixFilter;
import flash.geom.ColorTransform;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.Dictionary;

public class MapHandler extends Sprite {

    public var goDict_:Dictionary;
    public var gs_:GameSprite;
    public var name_:String;
    public var player_:Player = null;
    public var showDisplays_:Boolean;
    public var music_:Vector.<String>;
    public var width_:int;
    public var height_:int;
    public var _vv:int;
    public var allowPlayerTeleport_:Boolean;
    public var background_:MapOverlay = null;
    public var map_:Sprite;
    public var weatherBackground_:Weather = null;
    public var _063:_M_9 = null;
    public var _C_K_:_3m = null;
    public var mapOverlay_:_0C_Q_ = null;
    public var partyOverlay_:_zh = null;
    public var _0K_A_:Vector.<Square>;
    public var squares_:Vector.<Square>;
    public var _cl:Dictionary;
    public var merchLookup_:Object;
    public var party_:_ez = null;
    public var quest_:Quest = null;
    public var weather_:int;
    // public var signalRenderSwitch:?;
    protected var _1fF_:Boolean = false;


    public function MapHandler() {
        this.goDict_ = new Dictionary();
        this.map_ = new Sprite();
        this._0K_A_ = new Vector.<Square>;
        this.squares_ = new Vector.<Square>;
        this._cl = new Dictionary();
        this.merchLookup_ = {};
        //this.signalRenderSwitch = new (Boolean);
        super();
    }

    public function setProps(_arg1:int, _arg2:int, _arg3:String, _arg4:int, _arg5:Boolean, _arg6:Boolean, _arg7:Vector.<String>, _arg8:int, _arg9:int):void {
    }

    public function addObj(_arg1:BasicObject, _arg2:Number, _arg3:Number):void {
    }

    public function setGroundTile(_arg1:int, _arg2:int, _arg3:uint):void {
    }

    public function initialize():void {
    }

    public function dispose():void {
    }

    public function update(_arg1:int, _arg2:int):void {
    }

    public function pSTopW(_arg1:Number, _arg2:Number):Point {
        return (null);
    }

    public function removeObj(_arg1:int):void {
    }

    public function draw(_arg1:_0D_v, _arg2:int):void {
    }
}
}