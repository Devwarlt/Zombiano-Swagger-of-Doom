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
 * Created by Fabian on 04.03.2015.
 */
package MiniGames.MysteryBox {
import com.company.assembleegameclient.game.GameSprite;

import flash.display.DisplayObject;
import flash.display.Sprite;

public class MysteryBoxChild extends Sprite {
    [Inject]
    public var box:MysteryBox;
    [Inject]
    public var gs:GameSprite;

    public function setNewChild(name:String, args:Array=null):void {
        this.box.switchTo(name, args);
    }

    public function addAdditionalChild(child:DisplayObject):void {
        this.box.addAdditionalChild(child);
    }

    public function removeAdditionalChild(child:DisplayObject):void {
        this.box.removeAdditionalChild(child);
    }
}
}
