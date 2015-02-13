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

/**
 * Created by Fabian on 12.02.2015.
 */
package EasterEggs.EasterEggs {
import EasterEggs.EasterEggHandler;

import com.company.util.Keys;

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.KeyboardEvent;
import flash.system.LoaderContext;
import flash.utils.ByteArray;
import flash.utils.getQualifiedClassName;

public class EasterEgg extends EventDispatcher {

    protected var swf:ByteArray;
    protected var loader:Loader;
    private var handler:EasterEggHandler;
    private var parent:EventDispatcher;

    function EasterEgg(swf:ByteArray, eventObject:EventDispatcher, activateText:String) {
        this.swf = swf;
        this.handler = new EasterEggHandler(Vector.<uint>(Keys.getKeys(activateText)), fire, true);
        this.parent = eventObject;
        this.parent.addEventListener(KeyboardEvent.KEY_DOWN, this.handler.onKeyDown);
    }

    private function getFinalMovie():DisplayObject {
        this.loader = new Loader();
        var ctx:LoaderContext = new LoaderContext();
        ctx.allowCodeImport = true;
        this.loader.loadBytes(swf, ctx);

        return getMovie();
    }

    protected function getMovie():DisplayObject {
        return loader;
    }

    private function fire():void {
        if(EasterEggHandler.isPlaying()) return;
        dispatchEvent(new EasterEggEvent(getFinalMovie(), this.loader));
    }

    public function getId():String {
        return getQualifiedClassName(this);
    }

    public function dispose():void {
        this.parent.removeEventListener(KeyboardEvent.KEY_DOWN, this.handler.onKeyDown);
        this.handler = null;
        if(this.loader != null)
            this.loader.unloadAndStop(true);
        this.swf = null;
    }

    protected function resizeOnComplete(width:int=int.MIN_VALUE, height:int=int.MIN_VALUE):void {
        if(this.loader && this.loader.contentLoaderInfo) {
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, resize);

            function resize(event:Event):void {
                loader.contentLoaderInfo.content.width = width == int.MIN_VALUE ? loader.contentLoaderInfo.content.width : width;
                loader.contentLoaderInfo.content.height = height == int.MIN_VALUE ? loader.contentLoaderInfo.content.height : height;
            }
        }
    }

    protected function doStuffOnComplete(callback:Function):void {
        if (this.loader && this.loader.contentLoaderInfo) {
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, callback);
        }
    }
}
}
