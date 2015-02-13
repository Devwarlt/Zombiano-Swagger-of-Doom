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

//WebRequestEvents._mS_

package WebRequestEvents{
    import flash.events.Event;

    public class WebRequestErrorEvent extends Event {

        public static const TEXT_ERROR:String = "TEXT_ERROR";

        public var text_:String;

        public function WebRequestErrorEvent(_arg1:Object){
            super(TEXT_ERROR);
            if (_arg1 != null)
            {
                this.text_ = _arg1.toString();
            } else
            {
                this.text_ = "null";
            }
        }
        override public function clone():Event{
            return (new WebRequestErrorEvent(this.text_));
        }
        override public function toString():String{
            return (formatToString(TEXT_ERROR, "text_"));
        }

    }
}//package WebRequestEvents

