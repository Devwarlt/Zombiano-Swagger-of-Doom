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

//com.company.net.ServerConnection

package com.company.net {
import flash.events.EventDispatcher;
import flash.net.Socket;
import flash.utils.Dictionary;

import com.hurlant.crypto.symmetric.ICipher;
import com.hurlant.crypto.Crypto;

import flash.utils.ByteArray;

import com.hurlant.crypto.symmetric.IPad;

import flash.events.Event;
import flash.events.ProgressEvent;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.events.ErrorEvent;


public class TCPServerConnection extends GameServer {

    private var socket:Socket = null;

    public function TCPServerConnection(_arg1:Boolean = true) {
        super(_arg1, false);
    }

    override public function connect(_arg1:String, _arg2:int):void {
        if (this.socket)
            this.resetSocket();

        this.server_ = _arg1;
        this.port_ = _arg2;
        this.lastPktLength = -1;
        this.socket = new Socket();
        this.socket.connect(_arg1, _arg2);
        this.socket.addEventListener(Event.CONNECT, this._ux);
        this.socket.addEventListener(Event.CLOSE, this._of);
        this.socket.addEventListener(ProgressEvent.SOCKET_DATA, this._vL_);
        this.socket.addEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
        this.socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
    }

    override public function reconnectSocket():void {
        this.connect(this.server_, this.port_);
    }

    override public function resetSocket():void {
        if (!this.socket)
            return;

        if (this.socket.connected)
            this.socket.close();

        this.socket.removeEventListener(Event.CONNECT, this._ux);
        this.socket.removeEventListener(Event.CLOSE, this._of);
        this.socket.removeEventListener(ProgressEvent.SOCKET_DATA, this._vL_);
        this.socket.removeEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
        this.socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
        this.socket = null;
        this.pendingPackets.length = 0;
    }

    override public function sendPacket(_arg1:Packet):void {
        this.pendingPackets.push(_arg1);
        this.consume();
    }

    override protected function consume():void {
        var _local1:Packet;
        var _local2:ByteArray;
        if ((((this.socket == null)) || (!(this.socket.connected)))) {
            return;
        }
        for each (_local1 in this.pendingPackets) {
            _local2 = new ByteArray();
            _local1.writeToOutput(_local2);
            _local2.position = 0;
            this.socket.writeInt((_local2.bytesAvailable + 5));
            this.socket.writeByte(_local1.id_);
            this.socket.writeBytes(_local2);
            this._fj(_local1);
        }
        this.socket.flush();
        this.pendingPackets.length = 0;
    }

    private function _ux(_arg1:Event):void {
        if (this._073) {
            this.socket.writeMultiByte("<start/>", "utf-8");
            this.socket.writeByte(0);
        }
        this.consume();
        dispatchEvent(_arg1);
    }

    private function _of(_arg1:Event):void {
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

    private function _vL_(event:ProgressEvent):void {
        var messageId:uint;
        var message:Packet;
        var data:ByteArray;
        while (1) {
            if ((((this.socket == null)) || (!(this.socket.connected)))) break;
            if (this.lastPktLength == -1) {
                if (this.socket.bytesAvailable < 4) break;
                try {
                    this.lastPktLength = this.socket.readInt();
                } catch (error:Error) {
                    trace(((error.name + ": ") + error.message));
                    lastPktLength = -1;
                    return;
                }
            }
            if (this.socket.bytesAvailable < (this.lastPktLength - 4)) break;
            messageId = this.socket.readUnsignedByte();
            message = this.createPacketFromID(messageId);
            data = new ByteArray();
            if ((this.lastPktLength - 5) > 0) {
                this.socket.readBytes(data, 0, (this.lastPktLength - 5));
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
}

