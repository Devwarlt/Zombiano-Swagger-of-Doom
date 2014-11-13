// Decompiled by AS3 Sorcerer 2.72
// http://www.as3sorcerer.com/

//com.company.versionedloader.VersionedLoader

package com.company.versionedloader{
	import com.company.logo.AnimatedLogo;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.LocalConnection;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.system.Security;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	public class VersionedLoader extends Sprite {
		
		private static const ALLOWED_DOMAINS:Array = ["testing.amaymon.com", "www.amaymon.com", "localhost"];
		private static const DEFAULT_BYTES_TOTAL:int = (1 << 20);
		
		private var domain_:String;
		private var swfPrefix_:String;
		private var logo_:AnimatedLogo;
		private var status_:TextField;
		private var urlLoader_:URLLoader;
		private var loader_:Loader;
		private var game_:Sprite;
		private var protocol_:String = "http:";
		
		public function VersionedLoader(_arg_1:String){
			var _loc_3:String;
			var _loc_4:Object;
			var _loc_6:Object;
			super();
			this.logo_ = new AnimatedLogo();
			addChild(this.logo_);
			var _loc_2:LocalConnection = new LocalConnection();
			this.domain_ = "www.amaymon.com";
			for each (_loc_3 in ALLOWED_DOMAINS) {
				if (_loc_2.domain == _loc_3){
					this.domain_ = _loc_3;
				};
			};
			this.swfPrefix_ = _arg_1;
			Security.allowDomain("*");
			_loc_4 = LoaderInfo(this.loaderInfo).parameters;
			if (_loc_4.rotmg_loader_protocol == "https:"){
				this.protocol_ = _loc_4.rotmg_loader_protocol;
			};
			if (_loc_4.rotmg_loader_port != null){
				this.domain_ = (this.domain_ + _loc_4.rotmg_loader_port);
			};
			this.status_ = new TextField();
			this.status_.selectable = false;
			var _loc_5:TextFormat = new TextFormat();
			_loc_5.size = 10;
			_loc_5.color = 4286545791;
			this.status_.defaultTextFormat = _loc_5;
			this.status_.width = 800;
			this.status_.y = 360;
			this.setStatus("initializing");
			if (_loc_4.version_timestamp != null){
				_loc_6 = _loc_4.version_timestamp;
				this.loadSWF(_loc_6.toString());
			} else {
				this.urlLoader_ = new URLLoader();
				this.urlLoader_.addEventListener(Event.COMPLETE, this.onVersionComplete);
				this.urlLoader_.addEventListener(IOErrorEvent.IO_ERROR, this.onVersionIOError);
				this.urlLoader_.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onVersionSecurityError);
				this.loadVersion();
			};
		}
		private function setStatus(_arg_1:String):void{
			addChild(this.status_);
			this.status_.htmlText = '<p align="center">' + _arg_1 + "</p>";
		}
		private function removeStatus():void{
			removeChild(this.logo_);
			removeChild(this.status_);
		}
		private function loadVersion():void{
			var _loc_1:* = "";
			if (this.domain_ == "www.amaymon.com"){
				_loc_1 = this.domain_;
			} else {
				if (this.domain_ == "testing.amaymon.com"){
					_loc_1 = this.domain_;
				} else {
					_loc_1 = this.domain_;
				};
			};
			var _loc_2:* = this.protocol_ + "//" + _loc_1 + "/version.txt";
			var _loc_3:URLRequest = new URLRequest(_loc_2);
			_loc_3.data = new URLVariables("time=" + Number(new Date().time));
			this.urlLoader_.load(_loc_3);
			this.setStatus("loading version");
		}
		private function onVersionComplete(_arg_1:Event):void{
			var _loc_2:String = this.urlLoader_.data;
			this.loadSWF(_loc_2);
		}
		private function onVersionIOError(_arg_1:IOErrorEvent):void{
			this.retryLoadVersion();
		}
		private function onVersionSecurityError(_arg_1:SecurityErrorEvent):void{
			this.retryLoadVersion();
		}
		private function retryLoadVersion():void{
			this.setStatus("version loading error, retrying...");
			var _loc_1:Timer = new Timer(1000, 1);
			_loc_1.addEventListener(TimerEvent.TIMER_COMPLETE, this.onWaitDone);
		}
		private function onWaitDone(_arg_1:TimerEvent):void{
			this.loadVersion();
		}
		private function loadSWF(_arg_1:String):void{
			var _loc_2:* = this.protocol_ + "//" + this.domain_ + "/" + this.swfPrefix_ + _arg_1 + ".swf";
			var _loc_3:URLRequest = new URLRequest(_loc_2);
			this.loader_ = new Loader();
			this.loader_.load(_loc_3);
			this.loader_.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.onSWFProgress);
			this.loader_.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onSWFComplete);
			this.loader_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onSWFIOError);
			this.setStatus("loading SWF");
		}
		private function onSWFProgress(_arg_1:ProgressEvent):void{
			var _loc_2:Number = _arg_1.bytesTotal == 0 ? DEFAULT_BYTES_TOTAL : _arg_1.bytesTotal;
			var _loc_3:Number = Math.min(1, _arg_1.bytesLoaded / _loc_2);
			this.setStatus(int(_loc_3 * 100).toString() + "%");
		}
		private function onSWFComplete(_arg_1:Event):void{
			this.removeLoaderListeners();
			this.runSWF();
		}
		private function onSWFIOError(_arg_1:Event):void{
			this.removeLoaderListeners();
			this.restart();
		}
		private function removeLoaderListeners():void{
			this.loader_.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.onSWFProgress);
			this.loader_.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onSWFComplete);
			this.loader_.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.onSWFIOError);
		}
		private function runSWF():void{
			this.removeStatus();
			this.game_ = Sprite(this.loader_.content);
			this.game_.addEventListener(Event.COMPLETE, this.onGameComplete);
			addChild(this.game_);
		}
		private function onGameComplete(_arg_1:Event):void{
			this.restart();
		}
		private function restart():void{
			if (this.game_ != null){
				this.game_.removeEventListener(Event.COMPLETE, this.onGameComplete);
				removeChild(this.game_);
				this.game_ = null;
			};
			if (this.loader_ != null){
				this.loader_.unloadAndStop(true);
				this.loader_ = null;
			};
			this.loadVersion();
		}
		
	}
}//package com.company.versionedloader

