// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.net.messages.data._0H_9

package com.company.assembleegameclient.net.messages.data{
    import flash.utils.IDataInput;

    public class ObjectStatus {

        public var objectType_:int;
        public var stats:ObjectStatusData;

        public function ObjectStatus(){
            this.stats = new ObjectStatusData();
            super();
        }
        public function parseFromInput(_arg1:IDataInput):void{
            this.objectType_ = _arg1.readShort();
            this.stats.parseFromInput(_arg1);
        }
        public function toString():String{
            return (((("objectType_: " + this.objectType_) + " status_: ") + this.stats));
        }

    }
}//package com.company.assembleegameclient.net.messages.data

