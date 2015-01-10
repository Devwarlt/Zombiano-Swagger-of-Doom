// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._C_Q_

package _F_1{
import FireBite.Embeds.Images.OssiTitleScreenImage;
import FireBite.Embeds.Images.TitleScreenImage;

import _02t._R_f;
import _ke._0M_1;
import _qN_.Account;
import _sp._aJ_;
    
import com.company.assembleegameclient.appengine._0K_R_;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.rotmg.graphics.*;
import com.company.ui.SimpleText;

import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.net.URLRequest;
import flash.net.navigateToURL;

public class _C_Q_ extends _05p {

        public var _ft:_aJ_;
        private var playButton:_H_o;
        private var serversButton:_H_o;
        private var creditsButton:_H_o;
        private var accountButton:_H_o;
        private var legendsButton:_H_o;
        private var editorButton:_H_o;
        private var exitButton:_H_o;
		private var webButton:_H_o;
        private var versionText:SimpleText;
        private var copyrightText:SimpleText;
        private var _T_1:_0K_R_;

		private static const webUrl_:String = "http://localhost/";

        public function _C_Q_() {
            addChild(new _R_f());
            super(_C_Q_);
			if (Parameters._I_O_()) {
				addChild(new OssiTitleScreenImage());
				addChild(new TitleScreenGraphic());
			} else {
                addChild(new TitleScreenImage());
            	addChild(new TitleScreenGraphic());
			}
            this._ft = new _aJ_(String);
        }
        override public function initialize(_arg1:_0K_R_):void{
            super.initialize(_arg1);
            this._T_1 = _arg1;
            this.playButton = new _H_o(_0M_1.PLAY, 36, true);
            this.playButton.addEventListener(MouseEvent.CLICK, this._021);
            addChild(this.playButton);
            this.serversButton = new _H_o(_0M_1.SERVERS, 22, false);
            this.serversButton.addEventListener(MouseEvent.CLICK, this._021);
            addChild(this.serversButton);
            this.creditsButton = new _H_o(_0M_1.CREDITS, 22, false);
            this.creditsButton.addEventListener(MouseEvent.CLICK, this._021);
            addChild(this.creditsButton);
            this.accountButton = new _H_o(_0M_1.ACCOUNT, 22, false);
            this.accountButton.addEventListener(MouseEvent.CLICK, this._021);
            addChild(this.accountButton);
            this.legendsButton = new _H_o(_0M_1.LEGENDS, 22, false);
            this.legendsButton.addEventListener(MouseEvent.CLICK, this._021);
            addChild(this.legendsButton);
            this.editorButton = new _H_o(_0M_1.EDITOR, 22, false);
            this.editorButton.addEventListener(MouseEvent.CLICK, this._021);
            //this.editorButton.visible = _arg1._V_v;
            addChild(this.editorButton);
            this.exitButton = new _H_o(_0M_1.QUIT, 22, false);
            this.exitButton.addEventListener(MouseEvent.CLICK, this._021);
            //this.exitButton.visible = (Capabilities.playerType == "Desktop");
            addChild(this.exitButton);
			this.webButton = new _H_o(_0M_1.WEBSITE, 22, false);
			this.webButton.addEventListener(MouseEvent.CLICK, this.onClick);
			addChild(this.webButton);
            this.versionText = new SimpleText(12, 0x7F7F7F, false, 0, 0, "Myriad Pro");
            this.versionText.htmlText = (!Parameters.isTesting ? (Parameters._I_O_() ? "Testing " : "") : '<font color="#ff0000">DEVELOPMENT</font> ') + "v" + Parameters.clientVersion;
            this.versionText.updateMetrics();
            this.versionText.filters = [new DropShadowFilter(0, 0, 0)];
            addChild(this.versionText);
            this.copyrightText = new SimpleText(12, 0x7F7F7F, false, 0, 0, "Myriad Pro");
            this.copyrightText.text = "© 2014 by Fire Inc.";
            this.copyrightText.updateMetrics();
            this.copyrightText.filters = [new DropShadowFilter(0, 0, 0)];
            addChild(this.copyrightText);
            stage;
            this.playButton.x = ((800 / 2) - (this.playButton.width / 2));
            this.playButton.y = 524;
            stage;
            this.serversButton.x = (((800 / 2) - (this.serversButton.width / 2)) - 94);
            this.serversButton.y = 534;
            this.creditsButton.x = 180;
            this.creditsButton.y = 534;
            stage;
            this.accountButton.x = (((800 / 2) - (this.accountButton.width / 2)) + 96);
            this.accountButton.y = 534;
            this.legendsButton.x = 550;
            this.legendsButton.y = 534;
            this.editorButton.x = 50;
            this.editorButton.y = 534;
            this.exitButton.x = 124;
            this.exitButton.y = 534;
			this.webButton.x = 645;
			this.webButton.y = 534;
            stage;
            this.versionText.y = (600 - this.versionText.height);
            stage;
            this.copyrightText.x = (800 - this.copyrightText.width);
            stage;
            this.copyrightText.y = (600 - this.copyrightText.height);
        }
        private function _021(_arg1:MouseEvent):void{
            var _local2:_H_o = (_arg1.target as _H_o);
            this._ft.dispatch(_local2.name == _0M_1.EDITOR ? Account._get().admin_ ? _0M_1.EDITOR : _0M_1.SPRITEEDITOR : _local2.name);
        }
		private function onClick(_arg1:MouseEvent):void{
			navigateToURL(new URLRequest(webUrl_), "_blank");
		}

    }
}//package _F_1

