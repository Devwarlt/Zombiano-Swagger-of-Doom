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
package AccountManagement.images {
import flash.display.Bitmap;

public class AccountManagementImages {

    [Embed(source="account header.png")]
    public static const AccountHeaderBackground:Class;
    [Embed(source="arrow_white 40 new.png")]
    public static const Arrow:Class;
    [Embed(source="carbonBackground.png")]
    public static const carbonBackground:Class;
    [Embed(source="settings.png")]
    public static const settingsIcon:Class;
    [Embed(source="settings 2.png")]
    public static const settings2Icon:Class;
    [Embed(source="home.png")]
    public static const homeIcon:Class;
    [Embed(source="premium.png")]
    public static const premiumBig:Class;
    [Embed(source="defaultSpeechBubble.png")]
    public static const defaultSpeechBubble:Class;

    [Embed(source="bronzeFirePack.png")]
    public static const bronzeFirePack:Class;
    [Embed(source="silverFirePack.png")]
    public static const silverFirePack:Class;
    [Embed(source="goldFirePack.png")]
    public static const goldFirePack:Class;
    [Embed(source="premiumFirePack.png")]
    public static const premiumFirePack:Class;
    [Embed(source="premiumDLC.png")]
    public static const premiumDLC:Class;

    [Embed(source="openFirePacks.png")]
    public static const openFirePacks:Class;
    [Embed(source="gold-x5.png")]
    public static const gold_x5:Class;

    [Embed(source="event_01_thumb.png")]
    public static const event_01_thumb:Class;
    [Embed(source="event_01_detail.png")]
    public static const event_01_detail:Class;

    [Embed(source="pack_01_thumb.png")]
    public static const pack_01_thumb:Class;
    [Embed(source="pack_01_detail.png")]
    public static const pack_01_detail:Class;

    [Embed(source="achievements.png")]
    public static const achievements:Class;
    [Embed(source="achievement_image.png")]
    public static const achievement_image:Class;

    public static function nextArrow(scale:Number):Bitmap {
        var bmp:Bitmap = new Arrow();
        bmp.scaleX = bmp.scaleY = scale;
        return bmp;
    }

    public static function prevArrow(scale:Number):Bitmap {
        var bmp:Bitmap = new Arrow();
        bmp.scaleX = -(scale);
        bmp.scaleY = scale;
        return bmp;
    }
}
}
