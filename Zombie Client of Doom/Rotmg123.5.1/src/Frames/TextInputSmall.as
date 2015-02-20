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

package Frames {
import flash.events.Event;

public class TextInputSmall extends TextInput {

    public function TextInputSmall(description:String, displayAsPassword:Boolean, errorText:String) {
        super(description, displayAsPassword, errorText);
        this.nameText_.x = 6;
        this.inputText_.x = 6;
        this.errorText_.y = (this.inputText_.y + 32);
        draw();
    }

    override protected function onChange(_arg1:Event):void {
        if (this.inputText_.text.length == 0) {
            if (!this.nameText_.visible) {
                this.nameText_.visible = true;
            }
        }
        else {
            if (this.nameText_.visible) {
                this.nameText_.visible = false;
            }
        }
        super.onChange(_arg1);
    }
}
}
