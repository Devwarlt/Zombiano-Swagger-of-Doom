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

//_0G__._05L_

package _0G__{
    import ServerPackets.Death;
    import _W_D_._0I_H_;
    import _W_D_._G_J_;
    import com.company.assembleegameclient.parameters.Parameters;

    public class _05L_ {

        [Inject]
        public var _0K_K_:Death;
        [Inject]
        public var _R_g:_0I_H_;
        [Inject]
        public var _0I_s:_G_J_;

        public function execute():void{
            this._0I_s._sr = true;
            this._0I_s.info = this._0K_K_;
            this._0I_s._Z__ = this._R_g.charList.accountId_;
            this._0I_s._J_u = this._0K_K_.charId_;
            Parameters.data_.needsRandomRealm = false;
            Parameters.save();
        }

    }
}//package _0G__

