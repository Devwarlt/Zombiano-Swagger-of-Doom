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

//_W_D_._0M_A_

package _W_D_{
    import flash.display.DisplayObjectContainer;
    import flash.display.LoaderInfo;

    public class _0M_A_ {

        private const _Y_n:String = "Production";

        [Inject]
        public var root:DisplayObjectContainer;
        [Inject]
        public var _0K_y:_B_d;
        [Inject]
        public var domain:Domain;

        public function _I_O_():Boolean{
            return (!(this._B_z()));
        }
        public function _B_z():Boolean{
            if (this._0K_y._H_z())
            {
                return (this._0B_P_());
            }
            return (this.domain._H_n());
        }
        private function _0B_P_():Boolean{
            var _local1:LoaderInfo = this.root.loaderInfo;
            return ((_local1.parameters.deployment == this._Y_n));
        }

    }
}//package _W_D_

