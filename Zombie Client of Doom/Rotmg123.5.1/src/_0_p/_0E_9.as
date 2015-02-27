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

//_0_p._0E_9

package _0_p {
import flash.events.IEventDispatcher;

public interface _0E_9 extends IEventDispatcher {

    function get state():String;

    function get target():Object;

    function get initialized():Boolean;

    function get active():Boolean;

    function get suspended():Boolean;

    function get destroyed():Boolean;

    function initialize(_arg1:Function = null):void;

    function suspend(_arg1:Function = null):void;

    function resume(_arg1:Function = null):void;

    function destroy(_arg1:Function = null):void;

    function _8u(_arg1:Function):_0E_9;

    function _0C_t(_arg1:Function):_0E_9;

    function _3a(_arg1:Function):_0E_9;

    function _0L_T_(_arg1:Function):_0E_9;

    function _G_p(_arg1:Function):_0E_9;

    function _ks(_arg1:Function):_0E_9;

    function _8S_(_arg1:Function):_0E_9;

    function _N_Z_(_arg1:Function):_0E_9;

    function _dI_(_arg1:Function):_0E_9;

    function _zi(_arg1:Function):_0E_9;

    function _kf(_arg1:Function):_0E_9;

    function _0L_c(_arg1:Function):_0E_9;

}
}//package _0_p

