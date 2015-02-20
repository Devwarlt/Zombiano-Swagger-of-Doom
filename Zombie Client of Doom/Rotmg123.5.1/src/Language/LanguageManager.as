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

    function LanguageManager(onComplete:Function) {
        this.onComplete = onComplete;
        initialize();
    }

    private function register(lang:WebRequestSuccessEvent):void {
        XML.ignoreWhitespace = false; //to parse whitespaces at the end or beginning
        this.languageXml = new XML(lang.data_);
        XML.ignoreWhitespace = true; //disable it again to prevent some client issues
        onComplete();
    }

    public function getValue(key:String, defaultValue:String="{KEY}"):String {
        if(!this.languageXml || !this.languageXml.hasOwnProperty(key)) return defaultValue == "{KEY}" ? key : defaultValue;
        return this.languageXml.elements(key)[0].toString();
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
        req.addEventListener(WebRequestErrorEvent.TEXT_ERROR, WebMain.onLanguageError);
        req.sendRequest("/getLanguageStrings", {"languageType": Parameters.data_.language});
    }

    public static function get manager():LanguageManager {
        if (currentMgr == null) throw new IllegalOperationError("Language not loaded.\nLoad with \"LanguageManager.load(onCompleteFunction);\"");
        return currentMgr;
    }

    public static function load(onComplete:Function):void {
        if(currentMgr != null) throw new IllegalOperationError("Language already loaded\nDouble function call?");
        currentMgr = new LanguageManager(onComplete);
    }
}
}
