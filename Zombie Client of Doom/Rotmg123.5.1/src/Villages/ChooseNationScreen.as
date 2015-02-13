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
 * Created by Fabian on 31.01.2015.
 */
package Villages {
import AccountManagement.ui.FancyTextButton;

import Villages.nations.Country;

import WebRequestEvents.WebRequestErrorEvent;
import WebRequestEvents.WebRequestSuccessEvent;

import _0L_C_.DialogBox;
import _F_1._C_Q_;
import _qN_.Account;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.text.TextFieldAutoSize;

public class ChooseNationScreen extends Sprite {
    [Embed(source="nations/chooseNationBackground.jpg")]
    private static var background:Class;

    private var currentNation:nation;
    private var currentNationName:SimpleText;
    private var chooseButton:FancyTextButton;
    private var nW:Number = 0;
    private var nH:Number = 0;

    public function ChooseNationScreen() {
        addChild(new background());

        var text:SimpleText = new SimpleText(62, 0xffffff, false, 800);
        text.htmlText = '<p align="center">Choose your nation</p>';
        text.autoSize = TextFieldAutoSize.CENTER;
        text.filters = [new DropShadowFilter()];
        text.y = 10;
        addChild(text);

        this.currentNationName = new SimpleText(46, 0xffffff);
        this.currentNationName.text = "Unknown Nation";
        this.currentNationName.updateMetrics();
        this.currentNationName.filters = [new DropShadowFilter()];
        this.currentNationName.y = 400;
        this.currentNationName.x = (400 - (this.currentNationName.width / 2));
        addChild(this.currentNationName);

        this.chooseButton = new FancyTextButton(21, "Choose", 250);
        this.chooseButton.y = 500;
        this.chooseButton.x = 275;
        this.chooseButton.addEventListener(MouseEvent.CLICK, this.onChoose);
        addChild(this.chooseButton);

        for (var i:int = 0; i < 6; i++) {
            addNationWithId(i);
        }
    }

    private function addNationWithId(id:int):void {
        var h:Number = (100 + ((Math.floor(this.nH / 3) * 125) + (Math.floor(this.nH / 3) * 10)));
        var w:Number = (100 + (((this.nW % 3) * 200) + ((this.nW % 3) * 10)));
        var country:Country = new Country(id);

        var n:nation = new nation(country.name, country.id, country.image);
        n.x = w;
        n.y = h;
        n.filters = [new DropShadowFilter()];
        n.onClick = setCurrentNation;
        addChild(n);

        if(id == 0) {
            setCurrentNation(n);
        }

        this.nW++;
        this.nH++;
    }

    private function setCurrentNation(n:nation):void {
        if(this.currentNation != null) {
            this.currentNation.setSelected(false);
        }
        this.currentNation = n;
        this.currentNation.setSelected(true);

        this.currentNationName.text = this.currentNation.nationName;
        this.currentNationName.updateMetrics();
        this.currentNationName.x = (400 - (this.currentNationName.width / 2));
    }

    private function onChoose(event:MouseEvent):void {
        if(this.currentNation != null) {
            var dialogBox:DialogBox = new DialogBox("Are you sure you want to join:\n<font color='#00ff00'>" + this.currentNation.nationName + "</font>\n\n<font color='#ff0000'>Please note that this action can NOT be undone.</font>", "Confirm", "I am sure", "I am not sure");
            dialogBox.addEventListener(DialogBox.BUTTON1_EVENT, function(event:Event):void {
                chooseNation(currentNation);
                event.target.parent.removeChild(dialogBox);
            });

            dialogBox.addEventListener(DialogBox.BUTTON2_EVENT, function(event:Event):void {
                event.target.parent.removeChild(dialogBox);
            });
            addChild(dialogBox);
        }
    }

    private function chooseNation(n:nation):void {
        var query:Object = Account._get().credentials();
        query["nationId"] = n.nationId;

        var webRequest:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/nation");
        webRequest.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onChooseError);
        webRequest.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.chooseSuccess);
        webRequest.sendRequest("/chooseNation", query);
    }

    private function onChooseError(event:WebRequestErrorEvent):void {
        var dialogBox:DialogBox = new DialogBox("Error while choosing nation:\n<font color='#ff0000'>" + event.text_ + "</font>", "Error", "Ok", null);
        dialogBox.addEventListener(DialogBox.BUTTON1_EVENT, function(e:Event):void {
            e.target.parent.removeChild(dialogBox);
        });
        addChild(dialogBox);
    }

    private function chooseSuccess(event:WebRequestSuccessEvent):void {
        var nation:Country = new Country(XML(event.data_).Nation);
        var dialogBox:DialogBox = new DialogBox("<h2>Welcome to:\n<font color='#00ff00'>" + nation.name + "</font></h2>", "Success", "Continue", null);
        dialogBox.addEventListener(DialogBox.BUTTON1_EVENT, this.closeScreen);
        addChild(dialogBox);
    }

    private function closeScreen(event:Event):void {
        (parent as _C_Q_).reload();
        parent.removeChild(this);
    }
}
}

import flash.display.Bitmap;
import flash.display.GradientType;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Matrix;
import flash.utils.getTimer;

class nation extends Sprite {

    private var border:Sprite;
    private var oldTime:int;
    private var color:uint;

    public var nationName:String;
    public var nationId:int;
    public var onClick:Function;

    public function nation(name:String, id:int, image:Bitmap) {
        addChild(image);
        this.nationName = name;
        this.nationId = id;
        this.color = 0xff0000;

        this.border = new Sprite();
        this.border.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        addChild(this.border);
        this.addEventListener(MouseEvent.CLICK, this.onNationClick);
    }

    public function setSelected(val:Boolean):void {
        this.color = val ? 0x37FF00 : 0xff0000;
    }

    private function onEnterFrame(event:Event):void {
        var time:int;
        if ((time = ((getTimer() / 5) % 360)) != oldTime) {
            this.border.graphics.clear();
            var gradientMatrix:Matrix = new Matrix();
            gradientMatrix.createGradientBox(200, 125, (Math.PI / 180) * time, 0, 0);
            this.border.graphics.lineStyle(2);
            this.border.graphics.lineGradientStyle(GradientType.LINEAR, [0xffffff, this.color], [1.0, 1.0], [0, 255], gradientMatrix);
            this.border.graphics.drawRect(0, 0, 200, 125);
            this.border.graphics.endFill();
            this.oldTime = time;
        }
    }

    private function onNationClick(event:MouseEvent):void {
        if(this.onClick != null) {
            this.onClick(this);
        }
    }
}
