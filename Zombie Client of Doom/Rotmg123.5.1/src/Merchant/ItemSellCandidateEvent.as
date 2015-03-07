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
 * Created by Fabian on 07.03.2015.
 */
package Merchant {
import com.company.assembleegameclient.objects.ObjectLibrary;

import flash.display.BitmapData;
import flash.events.Event;

public class ItemSellCandidateEvent extends Event {

    public static const GOT_CANDIDATE:String = "onCandidateForSellGet";

    public var itemId:int;
    public var slotId:int;
    public var graphicsData:BitmapData;
    public var price:int;
    public var currency:int;
    public var sellAble:Boolean;

    public function ItemSellCandidateEvent(itemId:int, slotId:int, graphicsData:BitmapData) {
        super(GOT_CANDIDATE);

        this.itemId = itemId;
        this.slotId = slotId;
        this.graphicsData = graphicsData;

        if (this.sellAble = ObjectLibrary.Items[itemId].hasOwnProperty("SellInfo")) {
            this.price = ObjectLibrary.Items[itemId].SellInfo.@price;
            this.currency = ObjectLibrary.Items[itemId].SellInfo.@currency;
        }
        else {
            this.price = -1;
            this.currency = -1;
        }
    }
}
}
