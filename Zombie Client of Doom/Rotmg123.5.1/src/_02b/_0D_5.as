﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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

//_02b._0D_5

package _02b {
import Crafting.CraftingRecipes;
import Crafting.CraftingRequest;
import Crafting.SavedCraftingRecipes;

import _4X_._zU_;

import _W_D_.CharListHistory;

import _U_5._bo;

import flash.utils.Timer;

import com.company.assembleegameclient.appengine.CharWebRequests;

import WebRequestEvents.WebRequestErrorEvent;

import com.company.assembleegameclient.appengine.SavedCharsList;

import _qN_.Account;

import flash.events.TimerEvent;

public class _0D_5 extends _zU_ {

    private static const _W_1:int = 1000;

    [Inject]
    public var _0I_s:CharListHistory;
    [Inject]
    public var craftingRecipes:SavedCraftingRecipes;
    [Inject]
    public var _08e:_bo;
    private var _Z_w:Timer;
    private var _0D_b:CharWebRequests;
    private var recipeRequest:CraftingRequest;

    override protected function startTask():void {
        this._0D_b = new CharWebRequests();
        this._0D_b.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._ix);
        this._0D_b.addEventListener(SavedCharsList.SAVED_CHARS_LIST, this._dM_);

        this.recipeRequest = new CraftingRequest();
        this.recipeRequest.addEventListener(CraftingRecipes.CRAFTING_RECIPES, this.onCraftingReceived);

        this._J__();
    }

    private function _J__():void {
        this._0D_b.sendCharList();
        this.recipeRequest.sendRecipeRequest();
    }

    private function _ix(_arg1:WebRequestErrorEvent):void {
        if (_arg1.text_.search("AC.BAN") > -1) {
            this._08e.dispatch(_arg1.text_);
        } else {
            this._08e.dispatch('<p align="center">Load error, retrying</p>');
            if (_arg1.text_ == "Account credentials not valid") {
                this._wg();
            } else {
                this._5j();
            }
        }
    }

    private function _wg():void {
        Account._get().clear();
        this._J__();
    }

    private function _5j():void {
        this._Z_w = new Timer(_W_1, 1);
        this._Z_w.addEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
        this._Z_w.start();
    }

    private function _F_z(_arg1:TimerEvent):void {
        this._J__();
    }

    private function _dM_(_arg1:SavedCharsList):void {
        this._0I_s.charList = new SavedCharsList(_arg1.rawCharList);
        this._0I_s.needsReload = false;
        _C_t(true);
        if (this._Z_w != null) {
            this._qv();
        }
    }

    private function _qv():void {
        this._Z_w.stop();
        this._Z_w.removeEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
        this._Z_w = null;
    }

    private function onCraftingReceived(event:CraftingRecipes):void {
        this.craftingRecipes.recipes = new CraftingRecipes(event.recipes);
    }
}
}//package _02b

