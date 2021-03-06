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

    private var mediator:IContext;

    public function SimpleInjector(mediator:IContext) {
        this.mediator = mediator;
        registerClasses(this.mediator);
    }

    public function getIdentifier():String {
        throw new IllegalOperationError("You need to override this method, its abstract");
    }

    public final function getMediatorMap():IContext {
        return mediator;
    }

    public function registerClasses(context:IContext):void {
        throw new IllegalOperationError("You need to override this method, its abstract");
    }

    public function disposeInjector():void {
        this.mediator = null;
    }

    public function injectInto(instance:*):void {
        var curVar:XML;
        var curMeta:XML;
        for each (curVar in describeType(Object(instance).constructor).factory.variable) {
            for each (curMeta in curVar.metadata) {
                if (curMeta.@name == "Inject")
                    instance[curVar.@name] = getMediatorMap().getValueForType(curVar.@type);
            }
        }

        if ("initialize" in instance) {
            instance.initialize();
        }
    }
}
}
