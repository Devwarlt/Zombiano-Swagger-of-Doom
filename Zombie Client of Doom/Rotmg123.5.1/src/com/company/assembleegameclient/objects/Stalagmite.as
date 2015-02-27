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

//com.company.assembleegameclient.objects.Stalagmite

package com.company.assembleegameclient.objects {
import com.company.assembleegameclient.engine3d._uZ_;
import com.company.assembleegameclient.engine3d.ObjectFace3D;


public class Stalagmite extends GameObject {

    private static const bs:Number = (Math.PI / 6);//0.523598775598299
    private static const cs:Number = (Math.PI / 3);//1.0471975511966

    public function Stalagmite(_arg1:XML) {
        super(_arg1);
        var _local2:Number = (bs + (cs * Math.random()));
        var _local3:Number = (((2 * cs) + bs) + (cs * Math.random()));
        var _local4:Number = (((4 * cs) + bs) + (cs * Math.random()));
        _8J_ = new _uZ_();
        _8J_.vL_.push((Math.cos(_local2) * 0.3), (Math.sin(_local2) * 0.3), 0, (Math.cos(_local3) * 0.3), (Math.sin(_local3) * 0.3), 0, (Math.cos(_local4) * 0.3), (Math.sin(_local4) * 0.3), 0, 0, 0, (0.6 + (0.6 * Math.random())));
        _8J_.faces_.push(new ObjectFace3D(_8J_, new <int>[0, 1, 3]), new ObjectFace3D(_8J_, new <int>[1, 2, 3]), new ObjectFace3D(_8J_, new <int>[2, 0, 3]));
        _8J_.uvts_.push(0, 1, 0, 0.5, 1, 0, 1, 1, 0, 0.5, 0, 0);
    }
}
}//package com.company.assembleegameclient.objects

