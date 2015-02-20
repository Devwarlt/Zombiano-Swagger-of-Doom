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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.parameters.Parameters

package com.company.assembleegameclient.parameters{
import Language.LanguageManager;

import com.company.util._0A_s;
import com.company.util.Keys;

import flash.display.DisplayObject;
import flash.net.LocalConnection;
import flash.net.SharedObject;
import flash.system.Capabilities;
import flash.utils.Dictionary;

public class Parameters {

    public static const isTesting:Boolean = true;
	public static const sendErrors:Boolean = false;
    public static const clientVersion:String = "1.0.0";
    public static const gamePort:int = 2050;
    public static const _1h:Boolean = false;
    public static const _mg:uint = 10944349;
    public static const _8T_:uint = 0xFCDF00;
    public static const _F_g:int = 60;
    public static const _E_S_:int = 20;
    public static const SendInfo:String = "";
    public static const SendClient:String = "*Client*";
    public static const SendError:String = "*Error*";
    public static const SendHelp:String = "*Help*";
    public static const SendGuild:String = "*Guild*";
    public static const NAME_CHANGE_PRICE:int = 10;
    public static const CREATE_VILLAGE_PRICE:int = 100;
    public static const TUT_ID:int = -1;
    public static const NEXUS_ID:int = -2;
    public static const RAND_REALM:int = -3;
    public static const NEXUS_LIMBO:int = -4;
    public static const TEST_ID:int = -6;
    public static const MAX_SINK_VALUE:Number = 18;
    public static const ToS_Url_:String = "http://www.realmofthemadgod.com/TermsofUse.html";
	public static const musicUrl_:String = "127.0.0.1";
	public static const connection:String = getAccountServerIP();
    public static const HelpCommand:String = "Help:\n" + "[/pause]: pause the game (until you [/pause] again\n" + "[/who]: list players online\n" + "[/tutorial]: enter the tutorial\n" + "[/yell <message>]: send message to all players in Nexus\n" + "[/tell <player name> <message>]: send a private message to a player\n" + "[/guild <message>]: send a message to your guild\n" + "[/ignore <player name>]: don't show chat messages from player\n" + "[/unignore <player name>]: stop ignoring a player\n" + "[/teleport <player name>]: teleport to a player\n" + "[/trade <player name>]: request a trade with a player\n" + "[/invite <player name>]: invite a player to your guild\n" + "[/join <guild name>]: join a guild (invite necessary\n" + "[/?]: this message";
    public static const RSAKey:String = "-----BEGIN PUBLIC KEY-----\n" + "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzRQGnNw5kEaIpych+U4J" + "ZtuLnMJuQKEyU1FfcyHISNkYhy1jmSMPav+7D3Qg1R6exeeM6LtXvUEQ6Fgris1J" + "UVDr5gjII0ti98LvIsF/hgTk2VOvm2QK/1OpyAxni4RZuR8OE0p0Co0yUwhTVjfN" + "5Ooh4hntfuwVtk1AZEFudA9oOqdUbNwi98M9VIf+9vJWnx2zAx+1r7Ja/JDeM3Fb" + "YW9awMw4d0fpGoN/PfZGqKdgd4jjXLuhatSu13sAU39aPZAI2ku3MQRMQcUBLxDI" + "HyEq1NA+BztASjpYr3w+bX85bWZwPOBN95O3z6hbDTv/FZj5tpkVqaVhxqBeEbaR" + "ywIDAQAB\n" + "-----END PUBLIC KEY-----";

    public static var root:DisplayObject;
    public static var data_:Object = null;
    public static var _R_P_:int = 1;
    public static var _Q_b:int = 0;
    public static var _Q_w:Boolean = true;
    public static var _0F_o:Boolean = false;
    public static var _ih:Boolean = false;
    public static var doLogin:Boolean = true;
    private static var _Z_U_:SharedObject = null;
    private static var validKeys:Dictionary = new Dictionary();

    public static function _02Q_():String{
        return (!Parameters.isTesting ? "Production" : "Devel") + " Build #" + Parameters.clientVersion + (_I_O_() ? " Testing" : "");
    }
    public static function _I_O_():Boolean{
        return false;
        var _local2:Object;
        var _local3:LocalConnection;
        var _local1:Boolean;
        if (Capabilities.playerType == "Desktop") {
            _local2 = root.loaderInfo.parameters;
            _local1 = !(_local2.deployment == "Production");
        } else {
            _local3 = new LocalConnection();
            _local1 = !(_local3.domain == "amaymon.com");
        }
        return (_local1);
    }
    public static function getAccountServerIP():String{
        if (_I_O_()) {
            return ("25.185.44.56:80"); // _I_O_() -> TRUE -- Testing Enabled
        }
        return ("192.168.2.100"); // _I_O_() -> FALSE -- Testing Disabled
    }
	public static function _05w():String{
		return ("UA-99999999-1");
	}
    public static function load():void{
        try {
            _Z_U_ = SharedObject.getLocal("AssembleeGameClientOptions", "/");
            data_ = _Z_U_.data;
        } catch(error:Error) {
            data_ = {};
        }
        _fX_();
        save();
    }
    public static function save():void{
        try
        {
            if (_Z_U_ != null)
            {
                _Z_U_.flush();
            }
        } catch(error:Error)
        {
        }
    }
    private static function registerKeyBind(_arg1:String, _arg2:uint):void{
        if (!data_.hasOwnProperty(_arg1))
        {
            data_[_arg1] = _arg2;
        }
        validKeys[_arg1] = true;
    }
    public static function setKey(_arg1:String, _arg2:uint):void{
        var _local3:String;
        for (_local3 in validKeys)
        {
            if (data_[_local3] == _arg2)
            {
                data_[_local3] = Keys.UNSET;
            }
        }
        data_[_arg1] = _arg2;
    }
    private static function registerObjectValue(_arg1:String, _arg2:*):void{
        if (!data_.hasOwnProperty(_arg1))
        {
            data_[_arg1] = _arg2;
        }
    }
    public static function _fX_():void{
        registerKeyBind("moveLeft", Keys.A);
        registerKeyBind("moveRight", Keys.D);
        registerKeyBind("moveUp", Keys.W);
        registerKeyBind("moveDown", Keys.S);
        registerKeyBind("rotateLeft", Keys.Q);
        registerKeyBind("rotateRight", Keys.E);
        registerKeyBind("useSpecial", Keys.SPACE);
        registerKeyBind("interact", Keys.NUMBER_0);
        registerKeyBind("useInvSlot1", Keys.NUMBER_1);
        registerKeyBind("useInvSlot2", Keys.NUMBER_2);
        registerKeyBind("useInvSlot3", Keys.NUMBER_3);
        registerKeyBind("useInvSlot4", Keys.NUMBER_4);
        registerKeyBind("useInvSlot5", Keys.NUMBER_5);
        registerKeyBind("useInvSlot6", Keys.NUMBER_6);
        registerKeyBind("useInvSlot7", Keys.NUMBER_7);
        registerKeyBind("useInvSlot8", Keys.NUMBER_8);
        registerKeyBind("sprintKey", Keys.SHIFT);
        registerKeyBind("escapeToNexus", Keys.INSERT);
        registerKeyBind("escapeToNexus2", Keys.F5);
        registerKeyBind("autofireToggle", Keys.I);
        registerKeyBind("scrollChatUp", Keys.PAGE_UP);
        registerKeyBind("scrollChatDown", Keys.PAGE_DOWN);
        registerKeyBind("miniMapZoomOut", Keys.MINUS);
        registerKeyBind("miniMapZoomIn", Keys.PLUS);
        registerKeyBind("resetToDefaultCameraAngle", Keys.R);
        registerKeyBind("togglePerformanceStats", Keys.UNSET);
        registerKeyBind("options", Keys.O);
        registerKeyBind("toggleCentering", Keys.UNSET);
        registerKeyBind("chat", Keys.ENTER);
        registerKeyBind("chatCommand", Keys.SLASH);
        registerKeyBind("tell", Keys.TAB);
        registerKeyBind("guildChat", Keys.G);
        registerKeyBind("toggleFullscreen", Keys.UNSET);
		registerKeyBind("switchTabs", Keys.B);
        registerKeyBind("openGifts", Keys.P);
        registerObjectValue("playerObjectType", 782);
        registerObjectValue("playMusic", true);
        registerObjectValue("playSFX", true);
        registerObjectValue("playPewPew", true);
        registerObjectValue("playNotifySound", true);
        registerObjectValue("centerOnPlayer", true);
        registerObjectValue("preferredServer", null);
        registerObjectValue("needsTutorial", true);
        registerObjectValue("needsNexusTutorial", true);
        registerObjectValue("needsRandomRealm", true);
        registerObjectValue("cameraAngle", ((7 * Math.PI) / 4));
        registerObjectValue("defaultCameraAngle", ((7 * Math.PI) / 4));
        registerObjectValue("showQuestPortraits", true);
        registerObjectValue("fullscreenMode", false);
        registerObjectValue("showProtips", true);
        registerObjectValue("protipIndex", 0);
        registerObjectValue("joinDate", _0A_s._mP_());
        registerObjectValue("lastDailyAnalytics", null);
        registerObjectValue("allowRotation", false);
        registerObjectValue("charIdUseMap", {});
        registerObjectValue("drawShadows", true);
        registerObjectValue("textBubbles", true);
        registerObjectValue("showTradePopup", true);
        registerObjectValue("paymentMethod", null);
        registerObjectValue("filterLanguage", true);
        registerObjectValue("showGuildInvitePopup", true);
        registerObjectValue("showBeginnersOffer", false);
        registerObjectValue("beginnersOfferTimeLeft", 0);
        registerObjectValue("beginnersOfferShowNow", false);
        registerObjectValue("beginnersOfferShowNowTime", 0);
        registerObjectValue("watchForTutorialExit", false);
        registerObjectValue("contextualClick", true);
		registerObjectValue("inventorySwap", true);
		registerObjectValue("hidePlayerChat", false);
		registerObjectValue("chatStarRequirement", 1);
        registerObjectValue("clickForGold", false);
		registerObjectValue("rotationSpeed", 0.003);
        registerObjectValue("confirmCraftingBox", true);
        registerObjectValue("playAllyShootSound", true);
        registerObjectValue("musicVolume", 1);
        registerObjectValue("language", LanguageManager.TYPE_EN);
    }

}
}//package com.company.assembleegameclient.parameters

