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
 * Created by Fabian on 20.02.2015.
 */
package Abstract {
import AccountManagement.Frames.ChangePasswordFrame;
import AccountManagement.Frames.ForgotPasswordFrame;
import AccountManagement.Frames.LoginFrame;
import AccountManagement.Frames.RegisterAccountFrame;

import Frames.CraftingFrame;

import Frames.CreateVillageFrame;
import Frames.Frame;
import Frames.GiftViewFrame;
import Frames.LearnCraftingRecipeFrame;

import Frames.TextInput;
import Frames.TextInputBig;
import Frames.TextInputSmall;
import Frames._8x;
import Frames._A_R_;
import Frames._A_t;

import _D_d._R_c;

import avmplus.getQualifiedClassName;

import flash.errors.IllegalOperationError;
import flash.utils.Dictionary;

public class AbstractManager {

    private static var managers:Dictionary;

    private var baseClass:Class;
    private var childs:Vector.<Class>;

    public function AbstractManager(base:Class) {
        this.childs = new Vector.<Class>();
        this.baseClass = base;
    }

    public function extend(child:Class):AbstractManager {
        this.childs.push(child);
        return this;
    }

    public function isValid(object:*):Boolean {
        var child:Class;
        if (object is baseClass) {
            for each (child in this.childs) {
                if (object is child) return true;
            }
        }
        return false;
    }

    public function throwOnPureCall(object:*):void {
        if (!isValid(object)) {
            var errorMessage:String = "Class is abstract.\nValid Classes:\n\n";
            var child:Class;
            for each (child in this.childs)
                errorMessage += getQualifiedClassName(child) + (this.childs.indexOf(child) < this.childs.length - 1 ? "\n" : "");
            throw new IllegalOperationError(errorMessage);
        }
    }

    public static function configure(base:Class):AbstractManager {
        if (managers == null) managers = new Dictionary();
        if (managers[base] == undefined) {
            return managers[base] = new AbstractManager(base);
        }
        else throw new IllegalOperationError("Class already registered.");
    }

    public static function getConfig(base:Class):AbstractManager {
        if (managers[base] == undefined) throw new IllegalOperationError("Class not registered");
        return managers[base];
    }

    public static function register():void {
        AbstractManager.configure(TextInput).extend(TextInputSmall).extend(TextInputBig);
        AbstractManager.configure(Frame).extend(LearnCraftingRecipeFrame).extend(GiftViewFrame).extend(CreateVillageFrame).extend(CraftingFrame).extend(_A_t).extend(_A_R_).extend(_8x).extend(ChangePasswordFrame).extend(RegisterAccountFrame).extend(_R_c).extend(LoginFrame).extend(ForgotPasswordFrame);
    }
}
}
