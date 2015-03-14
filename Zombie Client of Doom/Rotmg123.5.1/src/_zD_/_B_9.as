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

//_zD_._B_9

package _zD_ {
import _C__.Mediator;

import com.company.assembleegameclient.ui.InventorySide;

public class _B_9 extends Mediator {

    [Inject]
    public var view:InventorySide;
    private var name:String;
    private var _06G_:Array;

    public function _B_9() {
        this._06G_ = ["Apple", "Tortilla", "Chainsaw", "Monkey", "Flotilla", "Zephyr", "Ghost", "Tupac", "Alluvial", "Dante", "Soprano", "Godzilla", "Hate", "Freebird", "Desire", "Good", "Nightie", "Osprey"];
        super();
    }

    override public function initialize():void {
    }

    override public function destroy():void {
        super.destroy();
    }

}
}//package _zD_

