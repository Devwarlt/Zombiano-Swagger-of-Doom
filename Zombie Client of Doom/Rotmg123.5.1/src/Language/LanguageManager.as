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
 * Created by Fabian on 19.02.2015.
 */
package Language {
import WebRequestEvents.WebRequestErrorEvent;
import WebRequestEvents.WebRequestSuccessEvent;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;

import flash.errors.IllegalOperationError;

public class LanguageManager {

    public static const TYPE_EN:String = "en";
    public static const TYPE_DE:String = "de";

    private static var currentMgr:LanguageManager;

    private var languageXml:XML;
    private var onComplete:Function;
    private var onError:Function;

    function LanguageManager(onComplete:Function, onError:Function) {
        this.onComplete = onComplete;
        this.onError = onError;
        initialize();
    }

    private function register(lang:WebRequestSuccessEvent):void {
        XML.ignoreWhitespace = false; //to parse whitespaces at the end or beginning
        this.languageXml = new XML(lang.data_);
        XML.ignoreWhitespace = true; //disable it again to prevent some client issues
        onComplete();
    }

    public function getValue(key:String, defaultValue:String = "{KEY}"):String {
        if (!this.languageXml || !this.languageXml.hasOwnProperty(key)) return defaultValue == "{KEY}" ? key : defaultValue;
        return formatColor(this.languageXml.elements(key)[0].toString());
    }

    private function formatColor(text:String):String {
        text = LanguageColors.replaceColor(text, LanguageColors.RED);
        text = LanguageColors.replaceColor(text, LanguageColors.BLUE);
        text = LanguageColors.replaceColor(text, LanguageColors.GREEN);
        text = LanguageColors.replaceColor(text, LanguageColors.YELLOW);
        text = LanguageColors.replaceColor(text, LanguageColors.PURPLE);
        text = LanguageColors.replaceColor(text, LanguageColors.ORANGE);
        text = LanguageColors.replaceColor(text, LanguageColors.WHITE);
        text = LanguageColors.replaceColor(text, LanguageColors.BLACK);
        return LanguageColors.replaceColor(text, LanguageColors.GOLD);
    }

    public function fillWithParameters(text:String, parameterNames:Vector.<String>, ... parameterValues):String {
        var ret:String = text;
        for (var i:int = 0; i < parameterNames.length, i++;) {
            ret = fillWithParameter(ret, parameterNames[i], parameterValues[i]);
        }
        return ret;
    }

    public function fillWithParameter(text:String, parameterName:String, parameterValue:*):String {
        return text.replace(parameterName, parameterValue.toString());
    }

    public function get languageType():String {
        return this.languageXml ? this.languageXml.@type : Parameters.data_.language;
    }

    public function get initialized():Boolean {
        return this.languageXml != null;
    }

    private function initialize():void {
        var req:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/app");
        req.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, register);
        req.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onError);
        req.sendRequest("/getLanguageStrings", {"languageType": Parameters.data_.language});
    }

    public static function get manager():LanguageManager {
        if (currentMgr == null) throw new IllegalOperationError("Language not loaded.\nLoad with \"LanguageManager.load(onCompleteFunction);\"");
        return currentMgr;
    }

    public static function load(onComplete:Function, onError:Function):void {
        if (currentMgr != null) throw new IllegalOperationError("Language already loaded\nDouble function call?");
        currentMgr = new LanguageManager(onComplete, onError);
    }
}
}
