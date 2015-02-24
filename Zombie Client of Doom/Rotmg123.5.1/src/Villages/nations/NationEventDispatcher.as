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
 * Created by Fabian on 24.02.2015.
 */
package Villages.nations {
import _C__._cM_;
import _U_5.CharListResetDispatcher;
import _U_5.SpriteTarget;
import flash.display.Sprite;

public class NationEventDispatcher extends _cM_{
    [Inject]
    public var view:ChooseNationScreen;
    [Inject]
    public var charListReset:CharListResetDispatcher;
    [Inject]
    public var target:SpriteTarget;

    override public function initialize():void {
        this.view.eventDispatcher.add(this.dispatch);
    }
    override public function destroy():void {
        this.view.eventDispatcher.remove(this.dispatch);
    }
    private function dispatch(displayObject:Sprite):void {
        this.charListReset.dispatch();
        this.target.dispatch(displayObject);
    }
}
}
