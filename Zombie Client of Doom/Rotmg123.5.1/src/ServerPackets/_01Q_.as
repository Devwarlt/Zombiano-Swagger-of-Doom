﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._01Q_

package ServerPackets{
    import com.company.net.Packet;
    import flash.utils.IDataOutput;

    public class _01Q_ extends Packet {

        public function _01Q_(_arg1:uint){
            super(_arg1);
        }
        final override public function writeToOutput(_arg1:IDataOutput):void{
            throw (new Error((("Client should not send " + id_) + " messages")));
        }

    }
}//package ServerPackets

