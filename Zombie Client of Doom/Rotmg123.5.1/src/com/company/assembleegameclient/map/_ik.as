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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.map._ik

package com.company.assembleegameclient.map{
    import com.company.assembleegameclient.engine3d.Face3D;
	import com.company.assembleegameclient.parameters.Parameters;
    import flash.display.BitmapData;

    import flash.display.IGraphicsData;

    public class _ik {

        public var animate_:int;
        public var face_:Face3D;
        public var _zT_:Number = 0;
        public var _P_U_:Number = 0;
        public var animateDx_:Number = 0;
        public var animateDy_:Number = 0;

        public function _ik(_arg1:BitmapData, _arg2:Vector.<Number>, _arg3:Number, _arg4:Number, _arg5:int, _arg6:Number, _arg7:Number){
            this.face_ = new Face3D(_arg1, _arg2, Square._cr.concat());
            this._zT_ = _arg3;
            this._P_U_ = _arg4;
            if (((!((this._zT_ == 0))) || (!((this._P_U_ == 0)))))
            {
                this.face_._0C_q.length = 0;
                this.face_._0C_q.push((0 + this._zT_), (0 + this._P_U_), 0, (1 + this._zT_), (0 + this._P_U_), 0, (1 + this._zT_), (1 + this._P_U_), 0, (0 + this._zT_), (1 + this._P_U_), 0);
                this.face_._B_A_(this.face_._0C_q);
                this.face_.bitmapFill_.repeat = true;
            }
            this.animate_ = _arg5;
            if (this.animate_ != _M_X_._0I_7)
            {
                this.face_.bitmapFill_.repeat = true;
            }
            this.animateDx_ = _arg6;
            this.animateDy_ = _arg7;
        }
        public function dispose():void{
            this.face_.dispose();
            this.face_ = null;
        }
        public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):Boolean{
            var _local4:Number;
            var _local5:Number;
            if (this.animate_ != _M_X_._0I_7)
            {
                _local4 = 0;
                _local5 = 0;
                switch (this.animate_)
                {
                    case _M_X_._02o:
                        _local4 = (this._zT_ + Math.sin(((this.animateDx_ * _arg3) / 1000)));
                        _local5 = (this._P_U_ + Math.sin(((this.animateDy_ * _arg3) / 1000)));
                        break;
                    case _M_X_._dq:
                        _local4 = (this._zT_ + ((this.animateDx_ * _arg3) / 1000));
                        _local5 = (this._P_U_ + ((this.animateDy_ * _arg3) / 1000));
                        break;
                }
                this.face_._0C_q.length = 0;
                this.face_._0C_q.push((0 + _local4), (0 + _local5), 0, (1 + _local4), (0 + _local5), 0, (1 + _local4), (1 + _local5), 0, (0 + _local4), (1 + _local5), 0);
                this.face_._B_A_(this.face_._0C_q);
            }
            return (this.face_.draw(_arg1, _arg2));
        }

    }
}//package com.company.assembleegameclient.map

