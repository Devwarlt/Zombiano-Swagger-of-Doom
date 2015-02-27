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

/**
 * Created by Fabian on 11.12.2014.
 */
package com.company.assembleegameclient.ui {
import com.company.ui.SimpleText;
import com.company.util.AssetLibrary;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.filters.DropShadowFilter;

public class Battery extends Sprite {

    public static const CHARGE_100:uint = 100;
    public static const CHARGE_090:uint = 90;
    public static const CHARGE_080:uint = 80;
    public static const CHARGE_070:uint = 70;
    public static const CHARGE_060:uint = 60;
    public static const CHARGE_050:uint = 50;
    public static const CHARGE_040:uint = 40;
    public static const CHARGE_030:uint = 30;
    public static const CHARGE_020:uint = 20;
    public static const CHARGE_010:uint = 10;
    public static const CHARGE_005:uint = 5;
    public static const CHARGE_000:uint = 0;

    private var icon:Bitmap;
    private var chargeText:SimpleText;
    private var currentCharge:int;

    public function Battery(currentCharge:int = -1) {
        this.currentCharge = currentCharge;
        resolveImage();
        resolveChargeText();
    }

    public function updateCharge(newCharge:int):void {
        this.currentCharge = newCharge;
        resolveImage();
        resolveChargeText();
    }

    public function get isInitialized():Boolean {
        return this.currentCharge != -1;
    }

    private function resolveImage():void {
        if (this.icon != null) {
            removeChild(this.icon);
            this.icon = null;
        }

        if (!isInitialized) {
            return;
        }

        switch (this.currentCharge) {
            case CHARGE_100:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0x00));
                break;
            case CHARGE_090:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0x01));
                break;
            case CHARGE_080:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0x02));
                break;
            case CHARGE_070:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0x03));
                break;
            case CHARGE_060:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0x04));
                break;
            case CHARGE_050:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0x05));
                break;
            case CHARGE_040:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0x06));
                break;
            case CHARGE_030:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0x07));
                break;
            case CHARGE_020:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0x08));
                break;
            case CHARGE_010:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0x09));
                break;
            case CHARGE_005:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0xA));
                break;
            case CHARGE_000:
                this.icon = new Bitmap(AssetLibrary._xK_("batteryCharges", 0xB));
                break;
        }
        this.icon.scaleX = this.icon.scaleY = 5.0;
        this.icon.filters = [new DropShadowFilter()];

        this.icon.x = 5;
        this.icon.y = 20;

        addChild(this.icon);
    }

    private function resolveChargeText():void {
        if (this.chargeText != null) {
            removeChild(this.chargeText);
            this.chargeText = null;
        }

        if (!isInitialized) {
            return;
        }
        this.chargeText = new SimpleText(16, 0x000000);
        this.chargeText.boldText(true);
        this.chargeText.text = this.currentCharge + "%";
        this.chargeText.updateMetrics();
        this.chargeText.x = this.icon.x + (this.icon.width / 2) - (this.chargeText.textWidth / 2) - 2.5;
        this.chargeText.y = this.icon.y + (this.icon.height / 2) - (this.chargeText.textHeight / 2) - 2.5;
        addChild(this.chargeText);
    }
}
}
