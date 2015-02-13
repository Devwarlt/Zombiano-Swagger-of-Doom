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

package _F_1
{
import flash.utils.*;
import mx.core.*;

[Embed(source="_dy.swf", symbol = "_F_1._dy")]
public class _dy extends mx.core.MovieClipLoaderAsset
{
    public function _dy()
    {
        this._2M_ = _F_1._S_G_;
        super();
        initialWidth = 16000 / 20;
        initialHeight = 12000 / 20;

    }

    public override function get movieClipData():flash.utils.ByteArray
    {
        if (_03m == null)
        {
            _03m = flash.utils.ByteArray(new this._2M_());
        }
        return _03m;
    }


    {
        _03m = null;
    }

    public var _2M_:Class;

    private static var _03m:flash.utils.ByteArray=null;
}
}