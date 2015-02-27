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

package ClientPackets {
import flash.utils.IDataOutput;

public class CraftPacket extends ClientPacket {

    public function CraftPacket(_arg1:uint) {
        super(_arg1);
        this.slots = new Vector.<int>();
    }

    public var objectId_:int;
    public var recipeString_:String;
    public var slots:Vector.<int>;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.objectId_);
        _arg1.writeUTF(this.recipeString_);

        _arg1.writeByte(slots.length);
        for each(var slot in slots) {
            _arg1.writeInt(slot);
        }
    }

    override public function toString():String {
        return formatToString("CRAFT", "objectId_", "recipeString_");
    }
}
}
