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

package {
import EasterEggs.EasterEggHandler;
import EasterEggs.EasterEggs.BoobyBoobyBoobyEasterEgg;
import EasterEggs.EasterEggs.DoubleSunPower;
import EasterEggs.EasterEggs.EasterEgg;
import EasterEggs.EasterEggs.EasterEggEvent;
import EasterEggs.EasterEggs.I_Kissed_A_Girl_EasterEgg;
import EasterEggs.EasterEggs.RobotUnicornAttack;

import Language.LanguageManager;

import WebRequestEvents.WebRequestErrorEvent;

import YouTube.YouTubePlayer;

import _05G_._X_G_;

import _0L_C_.DialogBox;

import _0_p._L_y;
import _9u._074;
import _C_5._tt;
import _C__._07U_;
import _G_A_._8P_;
import _G_A_._F_y;
import _I_j._V_4;
import _R_Q_._0K_S_;
import _T_o._083;
import _U_._K_a;
import _U_5._D_c;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.util.Keys;

import flash.desktop.NativeApplication;
import flash.desktop.SystemIdleMode;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.display.StageScaleMode;
import flash.events.*;
import flash.system.Capabilities;

[SWF(width="800", height="600", backgroundColor="#000000", frameRate="60")]
public class WebMain extends Sprite {

    private var context:_L_y;
    private var yt:YouTubePlayer;

    private static var currentEasterEgg:DisplayObject;
    private static var eggs:Vector.<EasterEgg>;

    private static var thisWebMain:WebMain;

    public function WebMain() {
        thisWebMain = this;
        if (stage)
        {
            playYt();
        } else
        {
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        }
    }
    private function onAddedToStage(_arg1:Event):void{
    	removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        playYt();
    }

    private function playYt():void {
        this._4y();
        this._i1();
        trace(stage.wmodeGPU);
        stage.scaleMode = StageScaleMode.EXACT_FIT;
        stage.addEventListener(Event.RESIZE, function(event:Event):void {
            if(stage.scaleMode != StageScaleMode.EXACT_FIT) {
                stage.scaleMode = StageScaleMode.EXACT_FIT;
            }
        });
        try {
            //yt = new YouTubePlayer("https://www.youtube.com/watch?v=x11Biz6ZFoE", true);
            //stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            //yt.endCallback = setup;
            //yt.error = setup;
            //yt.repeat = false;
            //addChild(yt);
            setup();
        } catch (e:Error) {
            setup();
        }
    }

    private function onKeyDown(event:KeyboardEvent):void {
        if(event.keyCode == Keys.ESCAPE) {
            yt.stop();
        }
    }

    private function setup():void{
        //this keeps the screen active (required for android and ios only)
        NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
        NativeApplication.nativeApplication.menu = null;

        EasterEggHandler.setup(this);
        EasterEggHandler.registerEasterEgg(new I_Kissed_A_Girl_EasterEgg(stage));
        EasterEggHandler.registerEasterEgg(new DoubleSunPower(stage));
        EasterEggHandler.registerEasterEgg(new RobotUnicornAttack(stage));
        EasterEggHandler.registerEasterEgg(new BoobyBoobyBoobyEasterEgg(stage));

        if(yt != null) removeChild(yt);
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        var _local1:_D_c = this.context._O_R_.getInstance(_D_c);
        _local1.dispatch();
        this._06p();
    }
    private function _4y():void{
        Parameters.root = stage.root;
    }
    private function _i1():void{
        this.context = new _8P_();
        this.context.extend(_07U_).extend(_083).configure(_F_y).configure(_074).configure(_tt).configure(_K_a).configure(_0K_S_).configure(_V_4).configure(_X_G_).configure(this);
    }
    private function _06p():void{
        if (Capabilities.playerType == "Desktop")
        {
            Parameters.data_.fullscreenMode = false;
            Parameters.save();
        }
    }

    public static function onLanguageError(event:WebRequestErrorEvent):void {
        thisWebMain.addChild(new DialogBox("An error has occurred:\nUnable to load language [" + LanguageManager.manager.languageType + "].", "D'oh, this isn't good", "Ok", null));
    }
}
}

