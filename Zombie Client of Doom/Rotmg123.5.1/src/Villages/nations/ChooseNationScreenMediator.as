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
 * Created by Fabian on 28.02.2015.
 */
package Villages.nations {
import _C__.Mediator;

import _F_1.GameLoadingScreen;

import _U_5.CharListResetDispatcher;
import _U_5.SpriteTarget;

public class ChooseNationScreenMediator extends Mediator {

    [Inject]
    public var view:ChooseNationScreen;
    [Inject]
    public var reset:CharListResetDispatcher;
    [Inject]
    public var target:SpriteTarget;

    override public function initialize():void {
        this.view.eventDispatcher.add(this.close);
    }

    override public function destroy():void {
        this.view.eventDispatcher.remove(this.close);
    }

    private function close():void {
        this.reset.dispatch();
        this.target.dispatch(new GameLoadingScreen());
    }
}
}
