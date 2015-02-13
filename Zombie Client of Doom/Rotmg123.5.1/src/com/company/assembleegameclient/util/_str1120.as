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
 * Created by Fabian on 12.11.2014.
 */
package com.company.assembleegameclient.util {
import flash.display.Graphics;

public class _str1120 {

    public function _str2527(_arg_1:int, _arg_2:int, _arg_3:_str1119, _arg_4:Graphics):void{
        var _local_5:int = (_arg_1 + _arg_3.width);
        var _local_6:int = (_arg_2 + _arg_3.height);
        var _local_7:int = _arg_3._str4769;
        if (_arg_3._str4765){
            _arg_4.moveTo(_arg_1, (_arg_2 + _local_7));
            _arg_4.lineTo((_arg_1 + _local_7), _arg_2);
        } else {
            _arg_4.moveTo(_arg_1, _arg_2);
        };
        if (_arg_3._str4766){
            _arg_4.lineTo((_local_5 - _local_7), _arg_2);
            _arg_4.lineTo(_local_5, (_arg_2 + _local_7));
        } else {
            _arg_4.lineTo(_local_5, _arg_2);
        };
        if (_arg_3._str4768){
            _arg_4.lineTo(_local_5, (_local_6 - _local_7));
            _arg_4.lineTo((_local_5 - _local_7), _local_6);
        } else {
            _arg_4.lineTo(_local_5, _local_6);
        };
        if (_arg_3._str4767){
            _arg_4.lineTo((_arg_1 + _local_7), _local_6);
            _arg_4.lineTo(_arg_1, (_local_6 - _local_7));
        } else {
            _arg_4.lineTo(_arg_1, _local_6);
        };
    }
}
}
