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

package com.company.net {

import flash.events.DatagramSocketDataEvent;
import flash.net.DatagramSocket;
import flash.utils.ByteArray;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.events.ErrorEvent;

    public class UDPServerConnection extends GameServer {

        private var socketDiddly:DatagramSocket = null;

        public function UDPServerConnection(_arg1:Boolean = true) {
            super(_arg1, true);
        }

        override public function connect(serverIpDiddly:String, portDiddly:int):void {
            if (this.socketDiddly != null) {
                this.resetSocket();
            }
            this.server_ = serverIpDiddly;
            this.port_ = portDiddly;
            this.lastPktLength = -1;
            this.socketDiddly = new DatagramSocket();
            this.socketDiddly.addEventListener(Event.CONNECT, this.onConnect);
            this.socketDiddly.addEventListener(Event.CLOSE, this.onClose);
            this.socketDiddly.addEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
            this.socketDiddly.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
            this.socketDiddly.bind(0, "0.0.0.0");
            this.socketDiddly.addEventListener(DatagramSocketDataEvent.DATA, this.incomingUdpData);
            this.socketDiddly.receive();

            dispatchEvent(new Event(Event.CONNECT));
        }

        override public function reconnectSocket():void {
            this.connect(this.server_, this.port_);
        }

        override public function resetSocket():void {
            if (this.socketDiddly == null) {
                return;
            }
            if (this.socketDiddly.connected) {
                this.socketDiddly.close();
            }
            this.socketDiddly.removeEventListener(Event.CONNECT, this.onConnect);
            this.socketDiddly.removeEventListener(Event.CLOSE, this.onClose);
            this.socketDiddly.removeEventListener(DatagramSocketDataEvent.DATA, this.incomingUdpData);
            this.socketDiddly.removeEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
            this.socketDiddly.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
            this.socketDiddly = null;
            this.pendingPackets.length = 0;
        }

        override protected function consume():void {
            var data:ByteArray = new ByteArray();
            var _local1:Packet;
            var _local2:ByteArray;
            if (!this.socketDiddly) return;
            for each (_local1 in this.pendingPackets) {
                _local2 = new ByteArray();
                _local1.writeToOutput(_local2);
                _local2.position = 0;
                data.writeInt((_local2.bytesAvailable + 5));
                data.writeByte(_local1.id_);
                data.writeBytes(_local2);
                this.socketDiddly.send(data, 0, data.length, this.server_, this.port_);
                this._fj(_local1);
            }
            this.pendingPackets.length = 0;
            data.position = 0;
        }

        private function onConnect(_arg1:Event):void {
            var data:ByteArray = new ByteArray();
            if (this._073) {
                data.writeMultiByte("<start/>", "utf-8");
                data.writeByte(0);
            }
            this.consume();
            dispatchEvent(_arg1);
        }

        private function onClose(_arg1:Event):void {
            trace("Lost connection to server");
            dispatchEvent(new Event(Event.CLOSE));
        }

        private function onIOError(_arg1:IOErrorEvent):void {
            trace(("IO Error: " + _arg1.text));
            dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, ("IO Error: " + _arg1.text)));
            dispatchEvent(new Event(Event.CLOSE));
        }

        private function onSecurityError(_arg1:SecurityErrorEvent):void {
            trace(("Security Error: " + _arg1.text));
            dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, ("Security Error: " + _arg1.text)));
            dispatchEvent(new Event(Event.CLOSE));
        }

        private function incomingUdpData(event:DatagramSocketDataEvent):void {
            var messageId:uint;
            var message:Packet;
            var data:ByteArray;
            if ((((this.socketDiddly == null)))) return;
            if (this.lastPktLength == -1) {
                if (event.data.bytesAvailable < 4) return;
                try {
                    this.lastPktLength = event.data.readInt();
                } catch (error:Error) {
                    trace(((error.name + ": ") + error.message));
                    lastPktLength = -1;
                    return;
                }
            }
            if (event.data.bytesAvailable < (this.lastPktLength - 4)) return;
            messageId = event.data.readUnsignedByte();
            message = this.createPacketFromID(messageId);
            data = new ByteArray();
            if ((this.lastPktLength - 5) > 0) {
                event.data.readBytes(data, 0, (this.lastPktLength - 5));
            }
            data.position = 0;
            this.lastPktLength = -1;
            if (message == null) {
                trace("Unknown message in protocol, bailing");
                this.resetSocket();
                dispatchEvent(new Event(Event.CLOSE));
                return;
            }
            try {
                message.parseFromInput(data);
            } catch (e:Error) {
                trace(("Error in protocol: " + e.toString()));
                this.resetSocket();
                dispatchEvent(new Event(Event.CLOSE));
                return;
            }
            this.packets[messageId].callback_(message);
            this._fj(message);
        }
    }
}
