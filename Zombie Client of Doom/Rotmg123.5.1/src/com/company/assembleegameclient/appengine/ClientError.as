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

//com.company.assembleegameclient.appengine._vG_

package com.company.assembleegameclient.appengine{
    import flash.events.ErrorEvent;
    import com.company.assembleegameclient.parameters.Parameters;
    import com.company.util._gv;
    import _qN_.Account;

    public class ClientError {

        public static const _0J_D_:Boolean = true;

        public static function reportClientError(_arg1:*):void{
            var _local4:String;
            var _local6:String;
            var _local7:WebRequest;
            var _local2:Error = (_arg1 as Error);
            var _local3:ErrorEvent = (_arg1 as ErrorEvent);
            var _local5:String;
            if (_local2 != null)
            {
                _local4 = _local2.message;
                _local5 = _local2.getStackTrace();
            } else
            {
                if (_local3 != null)
                {
                    _local4 = _local3.text;
                } else
                {
                    if (_arg1 != null)
                    {
                        _local4 = _arg1.toString();
                    }
                }
            }
            if (((_0J_D_) && ((_local5 == null))))
            {
                return;
            }
            if (Parameters.sendErrors)
            {
                _local6 = ((((((((("Build: " + Parameters._02Q_()) + "\n") + "message: ") + _local4) + "\n") + "stackTrace: ") + _local5) + "\n") + _gv._00f());
                _local7 = new WebRequest(Parameters.getAccountServerIP(), "/clientError", false);
                _local7.sendRequest("add", {
                    "text":_local6,
                    "guid":Account._get().guid()
                });
            } else {
				trace(_local4);
				trace(_local5);
            }
        }

    }
}//package com.company.assembleegameclient.appengine

