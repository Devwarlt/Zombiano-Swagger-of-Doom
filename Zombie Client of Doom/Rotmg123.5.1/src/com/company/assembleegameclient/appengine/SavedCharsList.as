// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.appengine._0K_R_

package com.company.assembleegameclient.appengine{
    import flash.events.Event;
    import com.company.util._0K_N_;

    import com.company.assembleegameclient.net.Server;
    import _qN_.Account;
    import com.company.assembleegameclient.util._04d;
    import com.company.assembleegameclient.parameters.Parameters;
    import com.company.assembleegameclient.objects.ObjectLibrary;

    import com.company.assembleegameclient.net.*;
    import _qN_.*;

    public class SavedCharsList extends Event {

        public static const SAVED_CHARS_LIST:String = "SAVED_CHARS_LIST";
        private static const _S_O_:int = 86400000;
        private static const defaultLatLong:_0K_N_ = new _0K_N_(37.4436, -122.412);

        public var charListString:String;
        public var rawCharList:XML;
        public var accountId_:int;
        public var nextCharId_:int;
        public var maxNumChars_:int;
        public var numChars_:int = 0;
        public var savedChars_:Vector.<SavedCharacter>;
        public var totalFame_:int = 0;
        public var fame_:int = 0;
        public var credits_:int = 0;
        public var nextCharSlotPrice_:int;
        public var rank:int;
        public var guildName_:String;
        public var guildRank_:int;
        public var servers_:Vector.<Server>;
        public var name_:String = null;
        public var nameChosen_:Boolean;
        public var converted_:Boolean;
        public var ownedSkins:Vector.<int>;
        public var gifts:Vector.<int>;
        public var admin_:Boolean;
        public var news_:Vector.<NewsItem>;
        public var latLong_:_0K_N_;
        public var serverVersion:String;

        public function SavedCharsList(_arg1:String){
            this.savedChars_ = new Vector.<SavedCharacter>();
            this.servers_ = new Vector.<Server>();
            this.ownedSkins = new Vector.<int>();
            this.gifts = new Vector.<int>();
            this.news_ = new Vector.<NewsItem>();
            super(SAVED_CHARS_LIST);
            this.charListString = _arg1;
            this.rawCharList = new XML(this.charListString);
            var _local2:XML = XML(this.rawCharList.Account);
            this.loadAccount(_local2);
            this.loadBeginnerPackage(_local2);
            this.loadGuild(_local2);
            this.initChars();
            this.loadServerVersion();
            this.loadServers();
            this.loadNews();
            this.loadLatLong();
            Account._get().reportIntStat("Rank", this.rank);
        }
        private function loadAccount(_arg1:XML):void{
            this.accountId_ = _arg1.AccountId;
            this.name_ = _arg1.Name;
            this.nameChosen_ = _arg1.hasOwnProperty("NameChosen");
            this.converted_ = _arg1.hasOwnProperty("Converted");
            this.admin_ = _arg1.hasOwnProperty("Admin");
            this.totalFame_ = int(_arg1.Stats.TotalFame);
            this.fame_ = int(_arg1.Stats.Fame);
            this.credits_ = int(_arg1.Credits);
            this.nextCharSlotPrice_ = int(_arg1.NextCharSlotPrice);
            this.rank = int(_arg1.Rank);

            var skins:String = String(_arg1.OwnedSkins).replace(" ", "");
            if(skins.indexOf(',') == -1) {
                this.ownedSkins.push(int(skins));
            }
            else {
                var sks:Array = (skins.split(','));

                for each (var skin:String in sks) {
                    this.ownedSkins.push(int(skin));
                }
            }

            var gifts:String = String(_arg1.Gifts).replace(" ", "");
            if(gifts.indexOf(',') == -1) {
                if(int(gifts) != 0)
                    this.gifts.push(int(gifts));
            }
            else {
                var gfts:Array = (gifts.split(','));

                for each (var gft:String in gfts) {
                    this.gifts.push(int(gft));
                }
            }

            Account._get().admin_ = (this.rank == 13);
        }
        private function loadBeginnerPackage(_arg1:XML):void{
            var _local2:int;
            var _local3:Number;
            var _local4:Boolean;
            if (_arg1.hasOwnProperty("BeginnerPackageTimeLeft"))
            {
                _local2 = _04d._3r(_arg1.BeginnerPackageTimeLeft);
                Parameters.data_.beginnersOfferTimeLeft = _local2;
                _local3 = new Date().time;
                _local4 = (((_local2 > 0)) && ((Parameters.data_.beginnersOfferShowNowTime < _local3)));
                Parameters.data_.beginnersOfferShowNow = _local4;
                if (_local4)
                {
                    Parameters.data_.beginnersOfferShowNowTime = (_local3 + _S_O_);
                }
            }
        }
        private function loadGuild(_arg1:XML):void{
            var _local2:XML;
            if (_arg1.hasOwnProperty("Guild"))
            {
                _local2 = XML(_arg1.Guild);
                this.guildName_ = _local2.Name;
                this.guildRank_ = int(_local2.Rank);
            }
        }
        private function initChars():void{
            var _local1:XML;
            this.nextCharId_ = int(this.rawCharList.@nextCharId);
            this.maxNumChars_ = int(this.rawCharList.@maxNumChars);
            for each (_local1 in this.rawCharList.Char)
            {
                this.savedChars_.push(new SavedCharacter(_local1, this.name_));
                this.numChars_++;
            }
            this.savedChars_.sort(SavedCharacter._N_Q_);
        }
        private function loadServers():void{
            var _local2:XML;
            var _local1:XML = XML(this.rawCharList.Servers);
            for each (_local2 in _local1.Server)
            {
                this.servers_.push(new Server(_local2.Name, _local2.DNS, Parameters.gamePort, new _0K_N_(Number(_local2.Lat), Number(_local2.Long)), Number(_local2.Usage), _local2.hasOwnProperty("AdminOnly"), _local2.hasOwnProperty("IsUDP")));
            }
        }
        private function loadServerVersion():void {
            this.serverVersion = this.rawCharList.@serverVersion;
        }
        private function loadNews():void{
            var _local2:XML;
            var _local1:XML = XML(this.rawCharList.News);
            for each (_local2 in _local1.Item)
            {
                this.news_.push(new NewsItem(_local2.Icon, _local2.Title, _local2.TagLine, _local2.Link, int(_local2.Date)));
            }
        }
        private function loadLatLong():void{
            if (((this.rawCharList.hasOwnProperty("Lat")) && (this.rawCharList.hasOwnProperty("Long"))))
            {
                this.latLong_ = new _0K_N_(Number(this.rawCharList.Lat), Number(this.rawCharList.Long));
            } else
            {
                this.latLong_ = defaultLatLong;
            }
        }
        public function _rv():int{
            return ((this.maxNumChars_ - this.numChars_));
        }
        public function hasAvailableCharSlot():Boolean{
            return ((this.numChars_ < this.maxNumChars_));
        }
        public function _04D_():Server{
            var _local4:Server;
            var _local5:int;
            var _local6:Number;
            //if (Parameters.isTesting)
            //{
            //    return (new Server("Ent", "localhost", Parameters.gamePort));
            //}
            var _local1:Server;
            var _local2:Number = Number.MAX_VALUE;
            var _local3:int = int.MAX_VALUE;
            for each (_local4 in this.servers_)
            {
                if (!((_local4._02s()) && (!(this.admin_))))
                {
                    if (_local4.name_ == Parameters.data_.preferredServer)
                    {
                        return (_local4);
                    }
                    _local5 = _local4.priority();
                    _local6 = _0K_N_.distance(this.latLong_, _local4._00r);
                    if ((((_local5 < _local3)) || ((((_local5 == _local3)) && ((_local6 < _local2))))))
                    {
                        _local1 = _local4;
                        _local2 = _local6;
                        _local3 = _local5;
                    }
                }
            }
            return (_local1);
        }
        override public function clone():Event{
            return (new SavedCharsList(this.charListString));
        }
        override public function toString():String{
            return (((((("[" + " numChars: ") + this.numChars_) + " maxNumChars: ") + this.maxNumChars_) + " ]"));
        }
    }
}//package com.company.assembleegameclient.appengine

