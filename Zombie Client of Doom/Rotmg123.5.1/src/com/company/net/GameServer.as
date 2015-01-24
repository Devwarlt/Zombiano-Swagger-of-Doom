/**
 * Created by Fabian on 16.01.2015.
 */
package com.company.net {
import flash.errors.IllegalOperationError;
import flash.events.EventDispatcher;
import flash.utils.Dictionary;

public class GameServer extends EventDispatcher {
    protected var _073:Boolean;
    protected var lastPktLength:int = -1;
    protected var server_:String;
    protected var port_:int;
    protected var packets:Dictionary;
    protected var pendingPackets:Vector.<Packet>;

    private var isUdp:Boolean;

    public function GameServer(_arg1:Boolean, isUDP:Boolean) {
        this.packets = new Dictionary();
        this.pendingPackets = new Vector.<Packet>();
        this.isUdp = isUDP;
        this._073 = _arg1;
    }

    public function sendPacket(_arg1:Packet):void {
        this.pendingPackets.push(_arg1);
        this.consume();
    }

    public function registerPacket(_arg1:uint, _arg2:Class, _arg3:Function):void {
        this.packets[_arg1] = new MessageType(_arg2, _arg3);
    }

    public function createPacketFromID(_arg1:uint):Packet {
        var _local2:MessageType = this.packets[_arg1];
        if (_local2 == null) {
            return (null);
        }
        var _local3:Packet;
        if (_local2.freeList_.length == 0) {
            _local3 = (((_local2.class_ == null)) ? new Packet(_arg1) : new _local2.class_(_arg1));
        } else {
            _local3 = _local2.freeList_.pop();
        }
        return (_local3);
    }

    public function _fj(_arg1:Packet):void {
        this.packets[_arg1.id_].freeList_.push(_arg1);
    }


    //abstract functions
    protected function consume():void {
        throw new IllegalOperationError("You need to override this function and don't call the base method.");
    }

    public function resetSocket():void {
        throw new IllegalOperationError("You need to override this function and don't call the base method.");
    }

    public function connect(serverIp:String, portDiddly:int):void {
        throw new IllegalOperationError("You need to override this function and don't call the base method.");
    }

    public function reconnectSocket():void {
        throw new IllegalOperationError("You need to override this function and don't call the base method.");
    }
}
}

import com.company.net.Packet;

class MessageType {

    public var class_:Class;
    public var freeList_:Vector.<Packet>;
    public var callback_:Function;

    public function MessageType(_arg1:Class, _arg2:Function){
        this.freeList_ = new Vector.<Packet>();
        super();
        this.class_ = _arg1;
        this.callback_ = _arg2;
    }
}
