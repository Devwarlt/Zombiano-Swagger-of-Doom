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

//com.company.assembleegameclient.screens.charrects.CreateNewCharacterRect

package com.company.assembleegameclient.screens.charrects {
import com.company.assembleegameclient.appengine.SavedCharsList;

import flash.display.Bitmap;

import com.company.ui.SimpleText;

import flash.display.DisplayObject;

import flash.display.Sprite;
import flash.display.Sprite;

import _sp._aJ_;

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.appengine.SavedCharacter;
import com.company.assembleegameclient.util._lJ_;

import flash.display.BitmapData;

import com.company.util.BitmapUtil;

import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.util.RankUtils;
import com.company.rotmg.graphics.ranks.AdminRank;

import flash.geom.ColorTransform;

public class CreateNewCharacterRect extends CharacterRect {

    private var charList_:SavedCharsList;
    private var bitmap_:Bitmap;
    private var classNameText_:SimpleText;
    private var taglineIcon_:DisplayObject;
    private var taglineText_:SimpleText;
    public var newCharacter:_aJ_;

    public function CreateNewCharacterRect(_arg1:SavedCharsList) {
        super(0x73543F, 0x6B472E);
        //super(0x691000, 0x8d1500);
        this.charList_ = _arg1;
        var _local2:XML = ObjectLibrary._tj[int((ObjectLibrary._tj.length * Math.random()))];
        var _local3:BitmapData = SavedCharacter.getImage(null, _local2, _lJ_.RIGHT, _lJ_._sS_, 0, false, false);
        _local3 = BitmapUtil._Y_d(_local3, 6, 6, (_local3.width - 12), (_local3.height - 6));
        this.bitmap_ = new Bitmap();
        this.bitmap_.bitmapData = _local3;
        this.bitmap_.x = 0;
        addChild(this.bitmap_);
        this.classNameText_ = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.classNameText_.boldText(true);
        this.classNameText_.text = "New Character";
        this.classNameText_.updateMetrics();
        this.classNameText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.classNameText_.x = 58;
        addChild(this.classNameText_);
        if (this.charList_.rank != RankUtils._5e()) {
            this.taglineIcon_ = new AdminRank();
            this.taglineIcon_.x = 58;
            this.taglineIcon_.y = 26;
            this.taglineIcon_.filters = [new DropShadowFilter(0, 0, 0)];
            addChild(this.taglineIcon_);
            this.taglineText_ = new SimpleText(14, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this.taglineText_.text = ((RankUtils._5e() - this.charList_.rank) + " Class quests not yet completed");
            this.taglineText_.updateMetrics();
            this.taglineText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
            this.taglineText_.x = ((58 + this.taglineIcon_.width) + 2);
            this.taglineText_.y = 24;
            addChild(this.taglineText_);
        }
    }
}
}//package com.company.assembleegameclient.screens.charrects

