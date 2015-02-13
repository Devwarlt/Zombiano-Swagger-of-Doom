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

//com.company.assembleegameclient.appengine.RemoteTexture

package com.company.assembleegameclient.appengine{
    import flash.net.URLLoaderDataFormat;
    import WebRequestEvents.WebRequestSuccessEvent;
    import WebRequestEvents.WebRequestErrorEvent;
    import _089._W_s;
    import flash.utils.ByteArray;
    import flash.display.BitmapData;
	import com.company.assembleegameclient.parameters.Parameters;

    public class RemoteTexture {

        private static const _E_o:Number = Number(new Date().time);

        public var id_:String;
        public var _Z_Q_:String;
        public var callback_:Function;

        public function RemoteTexture(_arg1:String, _arg2:String, _arg3:Function):void{
            this.id_ = _arg1;
            this._Z_Q_ = _arg2;
            this.callback_ = _arg3;
        }
        public function run():void{
            var _local1:String = (this._Z_Q_ == "testing") ? "rotmgtesting.appspot.com" : (this._Z_Q_ == "production") ? "realmofthemadgod.appspot.com" : Parameters.getAccountServerIP();
            var _local2:WebRequest = new WebRequest(_local1, "/picture", false);
            _local2._R_z(URLLoaderDataFormat.BINARY);
            _local2.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.onURLLoadComplete);
            _local2.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onError);
            _local2.sendRequest("get", {
                "id":this.id_,
				"instance":this._Z_Q_,
                "time":_E_o
            });
        }
        public function onURLLoadComplete(_arg1:WebRequestSuccessEvent):void{
            var urcool = new _W_s();
            var _local2:BitmapData = urcool._80((_arg1.data_ as ByteArray));
            this.callback_(_local2);
        }
        public function onError(_arg1:WebRequestErrorEvent):void{
        }

    }
}//package com.company.assembleegameclient.appengine

