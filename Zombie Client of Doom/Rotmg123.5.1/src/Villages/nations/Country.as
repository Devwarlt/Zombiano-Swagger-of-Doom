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
 * Created by Fabian on 31.01.2015.
 */
package Villages.nations {
import flash.display.Bitmap;

public class Country {
    [Embed(source="usaFlag.jpg")]
    private static var usaFlag:Class;
    [Embed(source="germanyFlag.jpg")]
    private static var germanyFlag:Class;
    [Embed(source="netherlandsFlag.jpg")]
    private static var netherlandsFlag:Class;
    [Embed(source="vietnamFlag.jpg")]
    private static var vietnamFlag:Class;
    [Embed(source="canadaFlag.jpg")]
    private static var canadaFlag:Class;
    [Embed(source="israelFlag.jpg")]
    private static var israelFlag:Class;

    public var image:Bitmap;
    public var name:String;
    public var id:int;

    public function Country(id:int) {
        this.id = id;
        switch (this.id) {
            case -1:
                this.name = "Country not set";
                this.image = new Bitmap();
                break;
            case 0:
                this.name = "United States of America";
                this.image = new usaFlag();
                break;
            case 1:
                this.name = "Germany";
                this.image = new germanyFlag();
                break;
            case 2:
                this.name = "Israel";
                this.image = new israelFlag();
                break;
            case 3:
                this.name = "Canada";
                this.image = new canadaFlag();
                break;
            case 4:
                this.name = "Vietnam";
                this.image = new vietnamFlag();
                break;
            case 5:
                this.name = "Netherlands";
                this.image = new netherlandsFlag();
                break;
            default:
                this.name = "Invalid Country";
                this.image = new Bitmap();
                break;
        }
    }
}
}
