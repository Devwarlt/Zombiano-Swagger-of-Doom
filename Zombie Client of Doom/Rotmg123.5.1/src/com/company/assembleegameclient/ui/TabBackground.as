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

package com.company.assembleegameclient.ui
{
	import com.company.util.GraphicHelper;
	
	import flash.display.DisplayObject;
	import flash.display.GraphicsPath;
	import flash.display.GraphicsSolidFill;
	import flash.display.IGraphicsData;
	import flash.display.Sprite;
	
	public class TabBackground extends Sprite
	{
		public var width_:int;
		public var height_:int;
		protected var fill_:GraphicsSolidFill;
		protected var path_:GraphicsPath;
		private var graphicsData_:Vector.<IGraphicsData>;
		
		public function TabBackground(_width:int, _height:int)
		{
			this.fill_ = new GraphicsSolidFill(0x473224, 1);//0x5C4434
			this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
			this.graphicsData_ = new <IGraphicsData>[this.fill_, this.path_, GraphicHelper.END_FILL];
			super();
			this.width_ = _width;
			this.height_ = _height;
		}
		
		public function draw(_firstTab:Boolean) {
			GraphicHelper._0L_6(this.path_);
			GraphicHelper.drawUI(0, 0, this.width_, this.height_, 6, [_firstTab ? 0 : 1, 1, 1, 1], this.path_);
			this.graphics.clear();
			this.graphics.drawGraphicsData(this.graphicsData_);
		}
	}
}