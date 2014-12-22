// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_01H_._f7

package _01H_ {
import _0L_C_.DialogBox;
import _0L_C_._qM_;

import _qN_.Account;
import _qN_._9j;

import _rK_._03W_;
import _rK_._B_c;
import _rK_._D_T_;

import _zo._8C_;
import _zo._mS_;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.appengine._02k;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.util._9S_;

import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.net.URLRequest;

public class _f7 extends Account {

    public static const _000:String = "steam";

    private static var _9Q_:Boolean = false;

    public var _Z_d;
    public var _cd:Stage;
    private var _ya:String = null;
    private var guid_:String = null;
    private var secret_:String = null;
    private var callback_:Function;

    override public function guid():String {
        return (this.guid_);
    }

    override public function secret():String {
        return ((((this.secret_) == null) ? "" : this.secret_));
    }

    override public function credentials():Object {
        return ({
            "guid": this.guid(),
            "secret": this.secret(),
            "steamid": this._Z_d.getSteamID()
        });
    }

    override public function isRegistered():Boolean {
        return (!((this.secret() == "")));
    }

    override public function gameNetworkUserId():String {
        return (this._Z_d.getSteamID());
    }

    override public function gameNetwork():String {
        return (_000);
    }

    override public function playPlatform():String {
        return ("steam");
    }

    override protected function internalLoad(_arg1:Stage, _arg2:Function):void {
        this._cd = _arg1;
        this.callback_ = _arg2;
        var _local3:Object = LoaderInfo(_arg1.root.loaderInfo).parameters;
        var _local4:String = _local3.steam_api_path;
        var _local5:URLRequest = new URLRequest(_local4);
        var _local6:Loader = new Loader();
        _local6.contentLoaderInfo.addEventListener(Event.COMPLETE, this._02n);
        _local6.load(_local5);
        _arg1.addChild(_local6);
    }

    override public function modify(_arg1:String, _arg2:String, _arg3:String):void {
        this.guid_ = _arg1;
        this.secret_ = _arg3;
    }

    override public function reportIntStat(_arg1:String, _arg2:int):void {
        this._Z_d.setStatFromInt(_arg1, _arg2);
    }

    override public function newAccountText():_9j {
        return (new _D_T_());
    }

    override public function newAccountManagement():Sprite {
        return (new _B_c());
    }

    override public function showInGameRegister(_arg1:Stage):void {
        this._Z_d.services.showRegistrationBox();
    }

    override public function cacheOffers():void {
        _02k._U_t("/steamworks", null);
    }

    override public function showMoneyManagement(_arg1:Stage):void {
        _arg1.addChild(new _03W_());
    }

    override public function entrytag():String {
        return ("steamworks");
    }

    public function _aT_():Boolean {
        return (_9S_._02A_(this.guid_));
    }

    public function _9a():String {
        return (this._Z_d.getPersonaName());
    }

    private function _029(_arg1:String = null):void {
        var _local3:String;
        var _local4:_qM_;
        var _local5:WebRequest;
        var _local2:String = this._Z_d.getSteamID();
        if ((((_local2 == null)) || ((_arg1 == null)))) {
            _local3 = "Failed to retrieve valid Steam Credentials! Click to retry.";
            _local4 = new _qM_(_local3);
            _local4.addEventListener(DialogBox.BUTTON1_EVENT, this._kr);
            this._cd.addChild(_local4);
        } else {
            if (_9Q_) {
                return;
            }
            _9Q_ = true;
            _local5 = new WebRequest(Parameters._fK_(), "/steamworks", true, 2);
            _local5.addEventListener(_8C_.GENERIC_DATA, this._6l);
            _local5.addEventListener(_mS_.TEXT_ERROR, this._T_);
            _local5.sendRequest("getcredentials", {
                "steamid": _local2,
                "sessionticket": _arg1
            });
        }
    }

    private function _kr(_arg1:Event):void {
        var _local2:_qM_ = (_arg1.target as _qM_);
        _local2.removeEventListener(DialogBox.BUTTON1_EVENT, this._kr);
        this._Z_d.requestSessionTicket(this._029, true);
    }

    private function _02n(_arg1:Event):void {
        this._Z_d = _arg1.target.content;
        this._Z_d.requestSessionTicket(this._029);
    }

    private function _6l(_arg1:_8C_):void {
        var _local2:XML = new XML(_arg1.data_);
        this.guid_ = _local2.GUID;
        this.secret_ = _local2.Secret;
        this.callback_();
    }

    private function _T_(_arg1:_mS_):void {
        this._cd.addChild(new _qM_(("Error: " + _arg1.text_)));
    }

}
}//package _01H_

