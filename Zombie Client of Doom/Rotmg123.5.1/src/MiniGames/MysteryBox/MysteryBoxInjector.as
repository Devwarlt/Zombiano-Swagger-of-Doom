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
 * Created by Fabian on 05.03.2015.
 */
package MiniGames.MysteryBox {
import SimpleInject.SimpleInjectMediator;
import SimpleInject.SimpleInjector;

import com.company.assembleegameclient.game.GameSprite;

public class MysteryBoxInjector extends SimpleInjector {

    private var box:MysteryBox;

    public function MysteryBoxInjector(box:MysteryBox) {
        this.box = box;
        super(new SimpleInjectMediator(this));
    }

    public override function getIdentifier():String {
        return "MysteryBox";
    }

    public override function registerClasses():void {
        this.map.map(GameSprite).to(this.box.gs);
        this.map.map(MysteryBox).to(this.box);
    }

    public override function disposeInjector():void {
        this.box = null;
        super.disposeInjector();
    }
}
}
