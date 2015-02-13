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
 * Created by Fabian on 18.12.2014.
 */
package AccountManagement {
import AccountManagement.images.AccountManagementImages;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.TextButton;
import com.company.ui.SimpleText;

import flash.display.Bitmap;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;

public class AccountManagementFooter extends Sprite {

    public static const WIDTH:int = 800;
    public static const HEIGHT:int = 70;

    private var closeBtn:TextButton;

    private var managementParent:AccountManagementScreen;

    public function AccountManagementFooter(parent:AccountManagementScreen) {
        this.managementParent = parent;

        var background:Bitmap = new AccountManagementImages.AccountHeaderBackground();
        background.y++;
        background.filters = [new GlowFilter()];
        addChild(background);
    }

    public function initialize():void {
        this.closeBtn = new TextButton(36, false, "Close");
        this.closeBtn.addEventListener(MouseEvent.CLICK, managementParent.dispatchAccountMouseEvent);
        this.closeBtn.x = ((WIDTH / 2) - (this.closeBtn.width / 2));
        this.closeBtn.y = ((HEIGHT / 2) - (this.closeBtn.height / 2));
        this.closeBtn.name = AccountManagementScreen.SHOW_MAIN_SCREEN;
        addChild(this.closeBtn);

        if (Parameters.isTesting) {
            var copyrightText:SimpleText = new SimpleText(12, 0x7F7F7F, false, 0, 0, "Myriad Pro");
            copyrightText.text = "Development Page";
            copyrightText.updateMetrics();
            copyrightText.filters = [new DropShadowFilter(0, 0, 0)];
            copyrightText.x = (WIDTH - copyrightText.width);
            copyrightText.y = (HEIGHT - copyrightText.height);
            addChild(copyrightText);
        }
    }
}
}
