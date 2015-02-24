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
 * Created by Fabian on 12.02.2015.
 */
package EasterEggs.EasterEggs {

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.events.EventDispatcher;

public class Pretty_Woman_EasterEgg extends EasterEgg {

    [Embed(source="eggs/Pretty Woman.swf", mimeType="application/octet-stream")]
    private static var woman:Class;

    public function Pretty_Woman_EasterEgg(dispatcher:EventDispatcher) {
        super(new woman(), dispatcher, "u r cool");//"I kissed a girl and I liked it the taste of her cherry chapstick");
    }

    override protected function getMovie():DisplayObject {
        var movie:Loader = Loader(super.getMovie());
        resizeOnComplete(800, 600);
        return movie;
    }
}
}
