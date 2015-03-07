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
import SimpleInject.IContext;
import SimpleInject.ISimpleInjector;
import SimpleInject.SimpleInjectMediatorMapper;
import SimpleInject.SimpleInjector;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.Player;

public class SellItemMerchantInjector extends SimpleInjector implements ISimpleInjector {

    private var merchant:SellItemMerchant;

    public function SellItemMerchantInjector(merchant:SellItemMerchant) {
        this.merchant = merchant;
        super(new SimpleInjectMediatorMapper(this));
    }

    public override function getIdentifier():String {
        return "SellItemMerchantInjector";
    }

    public override function registerClasses(context:IContext):void {
        context.map(GameSprite).to(this.merchant.gs);
        context.map(Player).to(this.merchant.gs.map_.player_);
    }
}
}
