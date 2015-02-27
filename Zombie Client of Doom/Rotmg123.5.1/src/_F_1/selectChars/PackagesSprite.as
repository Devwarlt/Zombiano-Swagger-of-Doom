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
 * Created by Fabian on 25.02.2015.
 */
package _F_1.selectChars {

import WebRequestEvents.WebRequestSuccessEvent;

import flash.display.Sprite;

public class PackagesSprite extends Sprite {

    public static const WIDTH:int = 760;
    public static const HEIGHT:int = 430;

    private var offer0:PackageBox; //big box
    private var offer1:PackageBox; //big box
    private var offer2:PackageBox; //small box
    private var offer3:PackageBox; //small box
    private var offer4:PackageBox; //small box
    private var offer5:PackageBox; //small box

    public function PackagesSprite() {
        //var req:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/packages");
        //req.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.onSuccess);
        //req.sendRequest("/getPackages", Account._get().credentials());
        var ev:WebRequestSuccessEvent = new WebRequestSuccessEvent(
                <Packages>
                    <Package id="0" slotId="0"></Package>
                    <Package id="1" slotId="1"></Package>
                    <Package id="2" slotId="2"></Package>
                    <Package id="3" slotId="3"></Package>
                    <Package id="4" slotId="4"></Package>
                    <Package id="5" slotId="5"></Package>
                </Packages>);
        onSuccess(ev);
    }

    private function onSuccess(event:WebRequestSuccessEvent):void {
        var offer:XML;
        for each (offer in XML(event.data_).Package) {
            var box:PackageBox = new PackageBox(offer);
            addChild(this["offer" + box.slotId] = box);
        }
    }
}
}

import flash.display.Loader;
import flash.display.Sprite;
import flash.net.URLRequest;

class PackageBox extends Sprite {

    private static const BIG_BOX_WIDTH:Number = 300;
    private static const BIG_BOX_HEIGHT:Number = 150;

    private static const SMALL_BOX_WIDTH:Number = 147.5;
    private static const SMALL_BOX_HEIGHT:Number = 130;

    public var slotId:int;

    private var data:XML;
    private var image:Loader;

    public function PackageBox(offer:XML) {
        this.data = offer;
        init();
        graphics.beginFill(0x000000, 0.8);
        graphics.drawRect(0, 0, width, height);
        graphics.endFill();
    }

    private function init():void {
        this.slotId = this.data.@slotId;
        this.image = new Loader();
        this.image.load(new URLRequest(this.data.Image));
        addChild(this.image);

        switch (this.slotId) {
            case 0:
                this.x = 97.5;
                this.y = 107.5 / 2;
                break;
            case 1:
                this.x = 97.5 + 5 + BIG_BOX_WIDTH;
                this.y = 107.5 / 2;
                break;
            case 2:
                this.x = 97.5;
                this.y = 107.5 / 2 + 5 + BIG_BOX_HEIGHT;
                break;
            case 3:
                this.x = 97.5 + 5 + SMALL_BOX_WIDTH;
                this.y = 107.5 / 2 + 5 + BIG_BOX_HEIGHT;
                break;
            case 4:
                this.x = 97.5 + 10 + SMALL_BOX_WIDTH * 2;
                this.y = 107.5 / 2 + 5 + BIG_BOX_HEIGHT;
                break;
            case 5:
                this.x = 97.5 + 15 + SMALL_BOX_WIDTH * 3;
                this.y = 107.5 / 2 + 5 + BIG_BOX_HEIGHT;
                break;
        }
    }

    override public function get height():Number {
        return this.slotId > 1 ? SMALL_BOX_HEIGHT : BIG_BOX_HEIGHT;
    }

    override public function get width():Number {
        return this.slotId > 1 ? SMALL_BOX_WIDTH : BIG_BOX_WIDTH;
    }
}
