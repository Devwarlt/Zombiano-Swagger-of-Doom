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

//_0_p._I_Y_

package _0_p {
import flash.events.Event;

public class _I_Y_ extends Event {

    public static const ERROR:String = "error";
    public static const _W_i:String = "preInitialize";
    public static const INITIALIZE:String = "initialize";
    public static const _wv:String = "postInitialize";
    public static const _7J_:String = "preSuspend";
    public static const _05j:String = "suspend";
    public static const _mx:String = "postSuspend";
    public static const _ob:String = "preResume";
    public static const _x8:String = "resume";
    public static const _Y_6:String = "postResume";
    public static const _0G_Z_:String = "preDestroy";
    public static const _8Z_:String = "destroy";
    public static const _0K_I_:String = "postDestroy";

    public var error:Error;

    public function _I_Y_(_arg1:String) {
        super(_arg1);
    }

    override public function clone():Event {
        var _local1:_I_Y_ = new _I_Y_(type);
        _local1.error = this.error;
        return (_local1);
    }

}
}//package _0_p

