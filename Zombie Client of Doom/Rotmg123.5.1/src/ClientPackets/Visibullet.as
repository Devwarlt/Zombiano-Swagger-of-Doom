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

package ClientPackets
{
	import flash.utils.IDataOutput;
	
	public class Visibullet extends ClientPacket
	{
		
		public var damage_:int;
		public var enemyId_:int;
		public var bulletId_:uint;
		
		public function Visibullet(param1:uint) {
			
			super(param1);
		}
		
		
		override public function writeToOutput(param1:IDataOutput) : void {
			param1.writeInt(this.damage_);
			param1.writeInt(this.enemyId_);
			param1.writeByte(this.bulletId_);
		}
		
		override public function toString() : String {
			return formatToString("VISIBULLET", "damage_","enemyId_","bulletId_");
		}
	}
}
