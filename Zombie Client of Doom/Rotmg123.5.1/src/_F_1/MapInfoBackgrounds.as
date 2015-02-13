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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

/**
 * Created by Fabian on 01.01.2015. #Rip 1st file 2k15
 */
package _F_1 {
import flash.display.BitmapData;

public class MapInfoBackgrounds {
    [Embed(source="top.jpg")]
    private static var himalayas:Class;
    [Embed(source="zombie_background_by_Ace_BGI.jpg")]
    private static var defaultBackground:Class;

    private static var data:Object;

    public static function load():void {
        data =
        {
            "himalayas": himalayas,
            "default": defaultBackground
        };
    }

    public static function getBackgroundImage(name:String):BitmapData {
        if(name == null) return null;
        return new data[name]().bitmapData;
    }
}
}
