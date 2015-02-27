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

/**
 * Created by Fabian on 13.12.2014.
 */
package Sounds {

public class LocalSounds {
    public static var openChest:LocalSound;
    public static var closeChest:LocalSound;
    public static var UX_InGame_Unlock_Item:LocalSound;
    public static var UX_InGame_Unlock_FirePack:LocalSound;
    public static var credits:LocalSound;

    private static var sounds:Object;

    public static function load():void {
        sounds =
        {
            "openChest": openChest = new LocalSound("openChest", soundBytes.openChest),
            "closeChest": closeChest = new LocalSound("closeChest", soundBytes.closeChest),
            "UX_InGame_Unlock_Item": UX_InGame_Unlock_Item = new LocalSound("UX_InGame_Unlock_Item", soundBytes.UX_InGame_Unlock_Item),
            "UX_InGame_Unlock_FirePack": UX_InGame_Unlock_FirePack = new LocalSound("UX_InGame_Unlock_FirePack", soundBytes.UX_InGame_Unlock_FirePack),
            "credits": credits = new LocalSound("credits", soundBytes.credits)
        };
    }

    public static function getSound(name:String):LocalSound {
        var ret:LocalSound = sounds[name];
        if (ret != null)
            ret.data.position = 0;
        return ret;
    }
}
}

class soundBytes {

    [Embed(source="local/sounds/openChest.mp3", mimeType="application/octet-stream")]
    public static var openChest:Class;
    [Embed(source="local/sounds/closeChest.mp3", mimeType="application/octet-stream")]
    public static var closeChest:Class;

    [Embed(source="local/sounds/UX_InGame_Unlock_Item.mp3", mimeType="application/octet-stream")]
    public static var UX_InGame_Unlock_Item:Class;
    [Embed(source="local/sounds/UX_InGame_Unlock_FirePack.mp3", mimeType="application/octet-stream")]
    public static var UX_InGame_Unlock_FirePack:Class;
    [Embed(source="local/sounds/credits.mp3", mimeType="application/octet-stream")]
    public static var credits:Class;
}
