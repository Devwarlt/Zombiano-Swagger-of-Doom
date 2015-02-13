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

//com.company.assembleegameclient.ui.InventorySide

package com.company.assembleegameclient.ui{
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.rotmg.graphics.ranks.premiumRank;
import com.company.ui.SimpleText;
import com.company.util.AssetLibrary;
	
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
	
import OptionsStuff.Options;

public class InventorySide extends Sprite {
		
		private var gs_:GameSprite;
		private var go_:Player;
		private var w_:int;
		private var h_:int;
		private var _tm:Bitmap;
		private var nameText_:SimpleText;
		private var _L_P_:Sprite;
		private var _nw:_rN_ = null;
		private var _sI_:_0M_Y_;
		private var _U_U_:_0M_Y_;
		private var _023:_0M_Y_;
		private var _F_C_:_0M_Y_;
		private var cooldownBar:_0M_Y_;
		private var _086:Stats;
		//private var _additionalStats:AdditionalStats;
		private var invTab_:TabButton;
		private var tabBackground:TabBackground;
		//private var additionalStatsTab_:TabButton;
		private var statTab_:TabButton;
		private var backpackTab1_:TabButton;
		private var backpackTab2_:TabButton;
		private var tabList_:Array;
		private var selectedTab_:int = 0;
		public var equips_:Inventory;
		public var _e9:Inventory;
		public var backpack1_:Inventory;
		public var backpack2_:Inventory;
		public var _0E__:int;
		
		private var stackPots:Boolean = false;
		
		public function InventorySide(_arg1:GameSprite, _arg2:Player, _arg3:int, _arg4:int){
			this.gs_ = _arg1;
			this.go_ = _arg2;
			this.w_ = _arg3;
			this.h_ = _arg4;
			this._tm = new Bitmap(null);
			this._tm.x = -2;
			this._tm.y = -10;
			addChild(this._tm);
			this.nameText_ = new SimpleText(_arg2.premium ? 16 : 20, 0xB3B3B3, false, 0, 0, "Myriad Pro");
			this.nameText_.boldText(true);
			var premiumIcon:DisplayObject;
			if(_arg2.premium) {
				premiumIcon = new premiumRank();
				premiumIcon.x = 35;
				premiumIcon.y = 1;
				premiumIcon.scaleX -= 0.02;
				premiumIcon.scaleY -= 0.02;
				addChild(premiumIcon);
			}

			this.nameText_.x = _arg2.premium ? (37 + premiumIcon.width) : 36;
			this.nameText_.y = _arg2.premium ?  1 : -2;
			if (this.gs_.charList_.name_ == null)
			{
				this.nameText_.text = this.go_.name_;
			} else
			{
				this.nameText_.text = this.gs_.charList_.name_;
            }
            this.nameText_.updateMetrics();
			this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
			addChild(this.nameText_);

			if (this.gs_.packetManager.gameId_ != Parameters.NEXUS_ID)
			{
				this._nw = new _rN_(AssetLibrary._xK_("lofiInterfaceBig", 6), "Nexus", "escapeToNexus");
				this._nw.addEventListener(MouseEvent.CLICK, this._Q_C_);
				this._nw.x = 172;
				this._nw.y = 2;
				addChild(this._nw);
			} else
			{
				this._nw = new _rN_(AssetLibrary._xK_("lofiInterfaceBig", 5), "Options", "options");
				this._nw.addEventListener(MouseEvent.CLICK, this._nD_);
				this._nw.x = 172;
				this._nw.y = 2;
				addChild(this._nw);
            }
            this._sI_ = new _0M_Y_(176, 16, 5931045, 0x473224, "Lvl X");
			//this._sI_.x = 12;
			//this._sI_.y = 30;
			this._sI_.x = 12;
			this._sI_.y = 78;
			addChild(this._sI_);
			this._sI_.visible = true;
			this._U_U_ = new _0M_Y_(176, 16, 0xE25F00, 0x473224, "Kills");
			//this._U_U_.x = 12;
			//this._U_U_.y = 30;
			this._U_U_.x = 12;
			this._U_U_.y = 78;
			addChild(this._U_U_);
			this._U_U_.visible = false;
			this._023 = new _0M_Y_(176, 16, 14693428, 0x473224, "Health");
			this._023.x = 12;
			this._023.y = 54;
			//this._023.x = 12;
			//this._023.y = 54;
			addChild(this._023);
			this._F_C_ = new _0M_Y_(176, 16, /*0x631212*/0x421111, 0x473224, "Hunger"); //6325472, 0x473224, "Hunger");
			this._F_C_.x = 12;
			this._F_C_.y = 30;
			//this._F_C_.x = 12;
			//this._F_C_.y = 78;
			addChild(this._F_C_);

			this.cooldownBar = new _0M_Y_(176, 16, /*6325472*/0x877D46, 0x473224, "Cool");
			this.cooldownBar.x = 12;
			this.cooldownBar.y = 102;
			addChild(this.cooldownBar);
			this.cooldownBar.visible = true;

			this.equips_ = new Inventory(_arg1, _arg2, "Inventory", _arg2._9A_.slice(0, 4), 4, true, 0, true);
			this.equips_.x = 14;
			this.equips_.y = 128;
			addChild(this.equips_);
			this.tabList_ = [];
			this.invTab_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x20), 0, true);
			this.invTab_.addEventListener(MouseEvent.CLICK, this.onTabClick);
			this.invTab_.x = 7;
			this.invTab_.y = 176;
			addChild(this.invTab_);
			this.tabList_[0] = this.invTab_;
			this.statTab_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x21), 1);
			this.statTab_.addEventListener(MouseEvent.CLICK, this.onTabClick);
			this.statTab_.x = this.invTab_.x + TabButton.WIDTH + 1;
			this.statTab_.y = 176;
			addChild(this.statTab_);
			this.tabList_[1] = this.statTab_;

			//this.additionalStatsTab_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x21), 2);
			//this.additionalStatsTab_.addEventListener(MouseEvent.CLICK, this.onTabClick);
			//this.additionalStatsTab_.x = this.statTab_.x + TabButton.WIDTH + 1;
			//this.additionalStatsTab_.y = 176;

			//var addNumber:SimpleText = new SimpleText(10, 0xffffff);
			//addNumber.text = "2";
			//addNumber.boldText(true);
			//addNumber.x = TabButton.WIDTH - addNumber.textWidth - 4;
			//addNumber.y = TabButton.HEIGHT - addNumber.textHeight - 4;
			//this.additionalStatsTab_.addChild(addNumber);
			//addChild(this.additionalStatsTab_);
			//this.tabList_[2] = this.additionalStatsTab_;


			this.backpackTab1_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x22), 2);
			this.backpackTab1_.addEventListener(MouseEvent.CLICK, this.onTabClick);
			this.backpackTab1_.x = this.statTab_.x + TabButton.WIDTH + 1;
			this.backpackTab1_.y = 176;
			addChild(this.backpackTab1_);
			this.tabList_[2] = this.backpackTab1_;

			this.backpackTab2_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x22), 3);
			this.backpackTab2_.addEventListener(MouseEvent.CLICK, this.onTabClick);
			this.backpackTab2_.x = this.backpackTab1_.x + TabButton.WIDTH + 1;
			this.backpackTab2_.y = 176;
			var bpNumber:SimpleText = new SimpleText(10, 0xffffff);
			bpNumber.text = "2";
			bpNumber.boldText(true);
			bpNumber.x = TabButton.WIDTH - bpNumber.textWidth - 4;
			bpNumber.y = TabButton.HEIGHT - bpNumber.textHeight - 4;
			this.backpackTab2_.addChild(bpNumber);
			addChild(this.backpackTab2_);
			this.tabList_[3] = this.backpackTab2_;

			this._086 = new Stats(191, 45);
			this._086.x = 6;
			this._086.y = 7;
			this.statTab_.holder_.addChild(this._086);
			this._e9 = new Inventory(_arg1, _arg2, "Inventory", _arg2._9A_.slice(4), 8, true, 4);
			this._e9.x = 7;
			this._e9.y = 7;
			this.invTab_.holder_.addChild(this._e9);

			this.backpack1_ = new Inventory(_arg1, _arg2, "Backpack", _arg2._9A_.slice(4), 8, true, 12);
			this.backpack1_.x = 7;
			this.backpack1_.y = 7;
			this.backpackTab1_.holder_.addChild(this.backpack1_);

			this.backpack2_ = new Inventory(_arg1, _arg2, "Backpack", _arg2._9A_.slice(4), 8, true, 20);
			this.backpack2_.x = 7;
			this.backpack2_.y = 7;
			this.backpackTab2_.holder_.addChild(this.backpack2_);

			//this._additionalStats = new AdditionalStats(191, 45);
			//this._additionalStats.x = 6;
			//this._additionalStats.y = 7;
			//this.additionalStatsTab_.holder_.addChild(this._additionalStats);
			mouseEnabled = false;
			this.tabBackground = this.invTab_.holder_;
			addChild(this.tabBackground);
			this.draw();
		}
		public function setName(_arg1:String):void{
			this.nameText_.text = _arg1;
			this.nameText_.updateMetrics();
		}
		private function _Q_C_(_arg1:MouseEvent):void{
			this.gs_.packetManager._M_6();
			Parameters.data_.needsRandomRealm = false;
			Parameters.save();
		}
		private function _nD_(_arg1:MouseEvent):void{
			this.gs_.mui_.clearInput();
			this.gs_.addChild(new Options(this.gs_));
		}
		private function onTabClick(me:MouseEvent):void {
			if(me.target is TabButton) {
				this.switchTab(me.target as TabButton);
			}
		}
		public function nextTab():void{
			if(this.selectedTab_ + 1 == this.tabList_.length) {
				this.switchTab(this.tabList_[0] as TabButton);
			} else {
				this.switchTab(this.tabList_[this.selectedTab_ + 1] as TabButton);
			}
		}
		public function switchTab(_tab:TabButton):void{
			if(_tab.selected_) return;
			for each(var i:TabButton in this.tabList_) {
				i.setSelected(false);
			}
			_tab.setSelected(true);
			this.removeChild(this.tabBackground);
			this.tabBackground = _tab.holder_;
			this.addChild(this.tabBackground);
			this.selectedTab_ = _tab.tabId_;
		}
		public function draw():void{
			this._tm.bitmapData = this.go_.getPortrait();
			var _local1:String = ("Lvl " + this.go_.level_);
			if (_local1 != this._sI_.labelText_.text)
			{
				this._sI_.labelText_.text = _local1;
				this._sI_.labelText_.updateMetrics();
            }
            if (this.go_.level_ != 20)
			{
				if (!this._sI_.visible)
				{
					this._sI_.visible = true;
					this._U_U_.visible = false;
                }
                this._sI_.draw(this.go_.exp_, this.go_._7V_, 0);
				if (this._0E__ != this.go_._gz)
				{
					this._0E__ = this.go_._gz;
					this._sI_._Y_r(this._0E__);
                }
            } else
			{
				if (!this._U_U_.visible)
				{
					this._U_U_.visible = true;
					this._sI_.visible = false;
                }
                this._U_U_.draw(this.go_.kills, this.go_._n8, 0);
            }
			this._023.draw(this.go_.HP_, this.go_.maxHP_, this.go_._P_7, this.go_._uR_);
			this._F_C_.draw(this.go_.MP_, this.go_.maxMP_, this.go_._0D_G_, this.go_._dt);
			this.cooldownBar.draw(this.go_.abilityCooldownSec, this.go_.abilityCooldownSecGoal, 0, 0);
			this._086.draw(this.go_);
			//this._additionalStats.draw(this.go_);
			this.equips_.draw(this.go_.equipment_.slice(0, 4));
			this._e9.draw(this.go_.equipment_.slice(4));
			this.backpackTab1_.visible = this.go_.backpack1 != null;
			this.backpackTab2_.visible = this.go_.backpack2 != null;
			this.backpack1_.draw(this.go_.backpack1);
			this.backpack2_.draw(this.go_.backpack2);
			this._e9.draw(this.go_.equipment_.slice(4));
			this.tabBackground.draw(this.tabList_[this.selectedTab_].tabId_ == 0);
		}
		public function destroy():void{
		}
		
	}
}//package com.company.assembleegameclient.ui

