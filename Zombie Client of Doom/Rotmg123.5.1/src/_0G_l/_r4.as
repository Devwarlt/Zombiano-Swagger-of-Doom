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

//_0G_l._r4

package _0G_l{
    import _0L_C_.DialogBox;

    public class _r4 extends DialogBox {

        public var id_:String;

        public function _r4(_arg1:String, _arg2:String){
            super(((('Are you sure you want to delete "' + _arg1) + '"?  ') + "This can not be undone."), "Delete Picture", "Cancel", "Delete");
            this.id_ = _arg2;
        }
    }
}//package _0G_l

