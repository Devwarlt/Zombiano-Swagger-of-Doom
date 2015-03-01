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
 * Created by Fabian on 01.03.2015.
 */
package Language {
public class LanguageColors {
    public static const RED:String = "{red}:{/red}:#FF0000";
    public static const BLUE:String = "{blue}:{/blue}:#0000FF";
    public static const GREEN:String = "{green}:{/green}:#00FF00";
    public static const YELLOW:String = "{yellow}:{/yellow}:#FFFF00";
    public static const PURPLE:String = "{purple}:{/purple}:#FF00F0";
    public static const ORANGE:String = "{orange}:{/orange}:#FF8000";
    public static const WHITE:String = "{white}:{/white}:#FFFFFF";
    public static const BLACK:String = "{black}:{/black}:#000000";
    public static const GOLD:String = "{gold}:{/gold}:#FFD700";

    public static const INDEX_BEGIN:int = 0;
    public static const INDEX_END:int = 1;
    public static const INDEX_COLOR:int = 2;

    public static function replaceColor(text:String, colorType:String):String {
        var colorData:Array = colorType.split(":");
        return text.replace(colorData[INDEX_BEGIN], '<font color="' + colorData[INDEX_COLOR] + '">').replace(colorData[INDEX_END], "</font>");
    }
}
}
