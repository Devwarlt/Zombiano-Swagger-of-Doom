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

/**
 * Created by Fabian on 27.02.2015.
 */
package com.company.assembleegameclient.map {

import flash.net.SharedObject;
import flash.utils.ByteArray;

public class MapCache {

    private var tiles:Vector.<Object>;
    private var worldId:int;
    public var loaded:Boolean;

    public function MapCache(worldId:int) {
        this.worldId = worldId;
        this.tiles = new Vector.<Object>();
    }

    public function setGroundTile(x:int, y:int, tileId:uint):void {
        if(contains(x, y)) {
            updateTile(x, y, tileId);
        }
        else {
            this.tiles.push({"x": x, "y": y, "tileId": tileId});
        }
    }

    public function updateTile(x:int, y:int, tileId:uint):void {
        var tile:Object;
        for each (tile in this.tiles) {
            if (tile.x == x && tile.y == y) {
                tile.tileId = tileId;
            }
        }
    }

    public function contains(x:int, y:int):Boolean {
        var tile:Object;
        for each (tile in this.tiles) {
            if (tile.x == x && tile.y == y) return true;
        }
        return false;
    }

    public function save():void {
        var cache:Object;

        try {
            var arr:ByteArray = new ByteArray();
            arr.writeObject(this.tiles);
            cache = SharedObject.getLocal("MapDataId" + worldId, "/");
            cache.data["Tiles"] = arr;
            cache.flush();
        } catch (error:Error) {
        }
    }

    public function setTileLoadCallback(loadCache:Function):void {
        var cache:Vector.<Object>;
        var element:Object;
        var tile:MapTile;

        try {
            var tileData:Object = SharedObject.getLocal("MapDataId" + worldId, "/");
            if (tileData.data.hasOwnProperty("Tiles")) {
                var br:ByteArray = tileData.data["Tiles"];
                cache = br.readObject();
            }

            for each (element in cache) {
                tile = new MapTile(element.x, element.y, element.tileId);
                this.tiles.push(tile);
                loadCache(tile);
            }
        } catch (error:Error) {
        }

        this.loaded = true;
    }
}
}
