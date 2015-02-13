﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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

//Effects._06s

package Effects{
    public class _06s extends Particle {

        public var lifetime_:int;
        public var timeLeft_:int;
        public var initialSize_:int;
        public var dx_:Number;
        public var dy_:Number;

        public function _06s(_arg1:int, _arg2:int, _arg3:int, _arg4:Number, _arg5:Number, _arg6:Number){
            super(_arg2, _arg4, _arg1);
            this.initialSize_ = _arg1;
            this.lifetime_ = (this.timeLeft_ = _arg3);
            this.dx_ = _arg5;
            this.dy_ = _arg6;
        }
        override public function update(_arg1:int, _arg2:int):Boolean{
            this.timeLeft_ = (this.timeLeft_ - _arg2);
            if (this.timeLeft_ <= 0)
            {
                return (false);
            }
            x_ = (x_ + ((this.dx_ * _arg2) / 1000));
            y_ = (y_ + ((this.dy_ * _arg2) / 1000));
            _H_9(((this.timeLeft_ / this.lifetime_) * this.initialSize_));
            return (true);
        }

    }
}//package Effects

