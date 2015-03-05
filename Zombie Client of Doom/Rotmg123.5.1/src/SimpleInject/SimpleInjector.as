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
package SimpleInject {
import flash.errors.IllegalOperationError;
import flash.utils.describeType;

public class SimpleInjector implements ISimpleInjector {

    protected var map:SimpleInjectMediator;

    public function SimpleInjector(mediator:SimpleInjectMediator) {
        this.map = mediator;
        registerClasses();
    }

    public function getIdentifier():String {
        throw new IllegalOperationError("You need to override this method, its abstract");
    }

    public function getMapper():SimpleInjectMediator {
        return map;
    }

    public function registerClasses():void {
        throw new IllegalOperationError("You need to override this method, its abstract");
    }

    public function disposeInjector():void {
        this.map = null;
    }

    public function injectInto(obj:*):void {
        var curVar:XML;
        var curMeta:XML;
        for each (curVar in describeType(Object(obj).constructor).factory.variable) {
            for each (curMeta in curVar.metadata) {
                if (curMeta.@name == "Inject")
                    obj[curVar.@name] = getMapper().getValueForType(curVar.@type);
            }
        }
    }
}
}
