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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_H_._2V_

package _D_H_{
    import flash.display.Sprite;
    import com.company.ui.SimpleText;
    import flash.filters.DropShadowFilter;


    public class _2V_ extends Sprite {

        public static const HEIGHT:int = 88;

        public var nameText_:SimpleText;
        public var __var:_09W_;

        public function _2V_(_arg1:Vector.<int>, _arg2:int){
            this.__var = new _09W_(_arg1);
            this.__var._ta(_arg2);
            this.__var.x = 80;
            addChild(this.__var);
            this.nameText_ = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this.nameText_.boldText(true);
            this.nameText_.text = "Type: ";
            this.nameText_.updateMetrics();
            this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
            this.nameText_.y = ((this.__var.height / 2) - (this.nameText_.height / 2));
            addChild(this.nameText_);
        }
        public function getType():int{
            return (this.__var.getType());
        }

    }
}//package _D_H_

