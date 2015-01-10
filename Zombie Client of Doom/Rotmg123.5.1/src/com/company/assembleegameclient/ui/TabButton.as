package com.company.assembleegameclient.ui
{
	import com.company.assembleegameclient.util.TextureRedrawer;
	import com.company.util.GraphicHelper;

import flash.display.Bitmap;

import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.GraphicsPath;
	import flash.display.GraphicsSolidFill;
	import flash.display.IGraphicsData;
import flash.display.Shape;
import flash.display.Sprite;
	
	public class TabButton extends Sprite
	{
		public var selected_:Boolean = false;
		public var tabId_:int = 0;
		public var holder_:TabBackground;
		private var bmap_:Bitmap;

		private var buttonMask:Shape;
		protected var fill_:GraphicsSolidFill;
		protected var path_:GraphicsPath;
		private var graphicsData_:Vector.<IGraphicsData>;
		public static const WIDTH:int = 28;
		public static const HEIGHT:int = 24;
			
		public function TabButton(_icon:BitmapData, _tabId:int, _selected:Boolean = false)
		{
			this.buttonMask = new Shape();
			this.buttonMask.graphics.beginFill(0x000000, 1);
			this.buttonMask.graphics.drawRect(0, 0, WIDTH, _tabId == 0 ? HEIGHT + 5 : HEIGHT);
			this.buttonMask.graphics.endFill();
			this.addChild(this.buttonMask);
			this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
			super();
			this.selected_ = _selected;
			this.bmap_ = new Bitmap(TextureRedrawer.redraw(_icon, (320 / _icon.width), true, 0, 0));
			this.bmap_.x = -6;
			this.bmap_.y = -10;
			this.addChild(this.bmap_);
			this.mask = this.buttonMask;
			this.holder_ = new TabBackground(186, 98);
			this.holder_.x = 7;
			this.holder_.y = 198;
			this.tabId_ = _tabId;
			this.draw();
			this.addChild(this.buttonMask);
		}
		
		public function setSelected(_selected:Boolean):void {
			this.selected_ = _selected;
			this.draw();
		}
		
		public function updateFill(_selected:Boolean):void {
			this.fill_ = new GraphicsSolidFill(_selected ? 0x473224 : 0x5C4434, 1);//0x73543F
			this.graphicsData_ = new <IGraphicsData>[this.fill_, this.path_, GraphicHelper.END_FILL];
		}
		
		public function draw():void {
			this.updateFill(this.selected_);
			GraphicHelper._0L_6(this.path_);
			GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT + 4, 2, [1, 1, 0, 0], this.path_);
			this.graphics.clear();
			this.graphics.drawGraphicsData(this.graphicsData_);
		}
	}
}