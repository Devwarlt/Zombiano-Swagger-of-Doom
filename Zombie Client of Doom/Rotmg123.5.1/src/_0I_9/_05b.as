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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0I_9._05b

package _0I_9 {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

public class _05b extends Sprite {

    private static const _0U_:String = ((('<p align="center"><font color="#FFFFFF">Play at: ' + '<br/></font><font color="#7777EE">') + '<a href="http://www.amaymon.com/">') + "www.amaymon.com</font></a></p>");

    public function _05b() {
        var _local1:TextField = new TextField();
        _local1.selectable = false;
        var _local2:TextFormat = new TextFormat();
        _local2.size = 20;
        _local1.defaultTextFormat = _local2;
        _local1.htmlText = _0U_;
        _local1.width = 800;
        _local1.y = ((600 / 2) - (_local1.height / 2));
        addChild(_local1);
    }
}
}//package _0I_9

