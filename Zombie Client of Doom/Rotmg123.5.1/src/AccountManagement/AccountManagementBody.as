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
 * Created by Fabian on 17.12.2014.
 */
package AccountManagement {
import AccountManagement.images.AccountManagementImages;
import AccountManagement.tabHolders.TabHolder;

import flash.display.Sprite;

public class AccountManagementBody extends Sprite{

    public static const WIDTH:int = 800;
    public static const HEIGHT:int = 450;

    public var managementParent:AccountManagementScreen;

    private var tabHolder:TabHolder;

    public function AccountManagementBody(parent:AccountManagementScreen) {
        this.managementParent = parent;
        addChild(new AccountManagementImages.carbonBackground());
    }

    public function initialize():void {
    }

    public function updateScreen(holder:TabHolder):void {
        if(this.tabHolder != null) {
            if (getChildIndex(this.tabHolder) != -1) {
                removeChild(this.tabHolder);
            }
        }
        this.tabHolder = holder;
        addChild(this.tabHolder);
    }
}
}