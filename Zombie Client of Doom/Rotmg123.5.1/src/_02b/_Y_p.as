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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_02b._Y_p

package _02b {
import _4X_._zU_;

import com.company.assembleegameclient.appengine.WebRequest;

import flash.globalization.DateTimeFormatter;
import flash.utils.Timer;

import com.company.assembleegameclient.parameters.Parameters;

import WebRequestEvents.WebRequestSuccessEvent;
import WebRequestEvents.WebRequestErrorEvent;

import flash.events.TimerEvent;

public class _Y_p extends _zU_ {

    public var accountId:int;
    public var charId:int;
    private var _01S_:WebRequest;
    private var _Z_w:Timer;
    public var xml:XML;
    public var name:String;
    public var level:int;
    public var type:int;
    public var _0N__:String;
    public var _pp:String;
    public var _P_9:int;
    public var character:XML;

    override protected function startTask():void {
        this._zB_();
    }

    private function _zB_():void {
        this._01S_ = new WebRequest(Parameters.getAccountServerIP(), "/char", true);
        this._01S_.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._00C_);
        this._01S_.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._C_I_);
        this._01S_.sendRequest("fame", this._2N_());
    }

    private function _2N_():Object {
        var _local1:Object = {};
        _local1.accountId = this.accountId;
        _local1.charId = (((this.accountId == -1)) ? -1 : this.charId);
        return (_local1);
    }

    private function _00C_(_arg1:WebRequestSuccessEvent):void {
        this.xml = new XML(_arg1.data_);
        this._7N_();
        this._eG_();
        _C_t(true);
    }

    private function _7N_():void {
        this.character = this.xml.Char.(@id == charId)[0];
        this.name = this.character.Account.Name;
        this.level = this.character.Level;
        this.type = this.character.ObjectType;
        this._0N__ = this._H_p();
        this._pp = (this.xml.KilledBy) || ("");
        this._P_9 = this.xml.TotalFame;
    }

    private function _eG_():void {
        this._01S_.removeEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._00C_);
        this._01S_.removeEventListener(WebRequestErrorEvent.TEXT_ERROR, this._C_I_);
        this._01S_ = null;
    }

    private function _C_I_(_arg1:WebRequestErrorEvent):void {
        this._eG_();
        this._Z_w = new Timer(1000, 1);
        this._Z_w.addEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
        this._Z_w.start();
    }

    private function _F_z(_arg1:TimerEvent):void {
        this._Z_w.removeEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
        this._Z_w = null;
        this._zB_();
    }

    private function _H_p():String {
        var _local1:Number = Number(this.xml.CreatedOn) * 1000;
        var _local2:Date = new Date(_local1);
        var _local3:DateTimeFormatter = new DateTimeFormatter(flash.globalization.LocaleID.DEFAULT);
        _local3.setDateTimePattern("MMMM D, YYYY");
        return _local3.format(_local2);
    }

}
}//package _02b

