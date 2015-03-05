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
import flash.utils.Dictionary;
import flash.utils.getDefinitionByName;

public class SimpleInjectMediator {

    private var injector:ISimpleInjector;
    private var definitions:Dictionary;

    public function SimpleInjectMediator(injector:ISimpleInjector) {
        this.injector = injector;
        this.definitions = new Dictionary();
    }

    public function map(type:Class):SimpleInjectMediator {
        this.definitions[type] = null;
        return this;
    }

    public function to(value:*):SimpleInjectMediator {
        this.definitions[Object(value).constructor] = value;
        return this;
    }

    public function getValueForType(name:String):* {
        return this.definitions[getDefinitionByName(name) as Class];
    }
}
}
