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

//_D_d._0H_J_

package _D_d{
    import _D_d._M_u;

    import com.company.assembleegameclient.map._pf;
    import com.company.util._L_2;

    import _D_d.*;

    internal class _0H_J_ extends _E_m {

        public function _0H_J_(){
            var _local1:String;
            var _local3:int;
            var _local4:_Q_S_;
            super(_M_u._6h);
            var _local2:Vector.<String> = new Vector.<String>();
            for (_local1 in _pf._pb)
            {
                _local2.push(_local1);
            }
            _local2.sort(_L_2._L_O_);
            for each (_local1 in _local2)
            {
                _local3 = _pf._pb[_local1];
                _local4 = new _Q_S_(_pf._Q_F_[_local3]);
                _08M_(_local4);
            }
        }
    }
}//package _D_d

