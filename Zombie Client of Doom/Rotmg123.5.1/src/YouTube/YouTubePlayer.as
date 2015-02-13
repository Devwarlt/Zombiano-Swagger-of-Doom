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
package YouTube {
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLRequest;
import flash.system.LoaderContext;
import flash.system.Security;
import flash.utils.ByteArray;

public class YouTubePlayer extends Sprite {

    [Embed("apiplayer.swf", mimeType="application/octet-stream")]
    private static const playerBase:Class;

    private var player:Object;
    private var loader:Loader;

    private var youtubeUrl:String;
    private var videoId:String;
    private var autoStart:Boolean;

    public var repeat:Boolean;
    public var endCallback:Function;
    public var playerReady:Function;
    public var error:Function;

    public function YouTubePlayer(url:String, autoStart:Boolean) {
        //Security.allowDomain("*", "www.youtube.com");
        //Security.allowInsecureDomain("*", "www.youtube.com");

        if(url.indexOf("youtube.com/watch?v=") == -1){
            throw new ArgumentError("Invalid url, the url should look like \"http://www.youtube.com/watch?v=HzI1KTZA1Ho\"");
        }
        this.youtubeUrl = url;
        this.autoStart = autoStart;
        this.buildYouTubeId();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    public function play():void {
        if(this.player != null && "playVideo" in this.player) {
            this.player.playVideo();
        }
    }

    public function stop():void {
        if(this.player != null && "stopVideo" in this.player) {
            this.player.stopVideo();
            if (endCallback != null) {
                endCallback();
            }
        }
    }

    public function pause():void {
        if(this.player != null && "pauseVideo" in this.player) {
            this.player.pauseVideo();
        }
    }

    private function onAddedToStage(event:Event):void {
        try {
            var context:LoaderContext = new LoaderContext(false, this.loaderInfo.applicationDomain);
            context.allowCodeImport = true;

            this.loader = new Loader();
            this.loader.load(new URLRequest("https://www.youtube.com/apiplayer?version=3"));
            //this.loader.loadBytes((new playerBase() as ByteArray), context);
            this.loader.contentLoaderInfo.addEventListener(Event.INIT, onLoaderInit);
        }
        catch (e:Error) {
            if(error != null) error();
        }
    }

    private function onLoaderInit(event:Event):void {
        try {
            addChild(this.loader);

            this.player = loader.content;
            this.player.addEventListener(YouTubePlayerEvent.READY, onPlayerReady);
            this.player.addEventListener(YouTubePlayerEvent.STATE_CHANGE, onStateChanged);
            this.player.addEventListener(YouTubePlayerEvent.ERROR, onError);
        }
        catch (e:Error) {
            if(error != null) error();
        }
    }

    private function onError(e:Event):void {
        trace(Object(e).data);
        if(error != null) {
            error();
        }
    }

    private function onPlayerReady(e:Event):void{
        player.setSize(800, 600);
        player.loadVideoById(this.videoId, 0);
        if(this.autoStart) {
            play();
        }

        var watchOnYoutubeOverlay:Sprite = new Sprite();
        watchOnYoutubeOverlay.graphics.beginFill(0x000000, 1.0);
        watchOnYoutubeOverlay.graphics.drawRect(700, 550, 100, 50);
        watchOnYoutubeOverlay.graphics.endFill();
        addChild(watchOnYoutubeOverlay);

        if(playerReady != null) {
            playerReady(this);
        }
    }

    private function onStateChanged(e:Event):void{
        if(Object(e).data == YouTubePlayerState.ENDED || Object(e).data == YouTubePlayerState.PAUSED) {
            if(repeat) {
                play();
            }
        }

        if(!repeat && Object(e).data == YouTubePlayerState.ENDED){
            if(endCallback != null){
                endCallback();
            }
        }
    }

    private function buildYouTubeId():void {
        var url:String = youtubeUrl.slice(youtubeUrl.indexOf("v=") + 2);
        while(url.lastIndexOf("&") > -1) {
             url = url.replace(url.slice(url.lastIndexOf("&")), "");
        }
        this.videoId = url;
    }
}
}

class YouTubePlayerEvent {
    public static const READY:String = "onReady";
    public static const STATE_CHANGE:String = "onStateChange";
    public static const PLAYBACK_QUALITY_CHANGE:String = "onPlaybackQualityChange";
    public static const PLAYBACK_RATE_CHANGE:String = "onPlaybackRateChange";
    public static const ERROR:String = "onError";
    public static const API_CHANGE:String = "onApiChange";
}

class YouTubePlayerState {
    public static const ENDED:int = 0;
    public static const PLAYING:int = 1;
    public static const PAUSED:int = 2;
    public static const BUFFERING:int = 3;
    public static const CUED:int = 5;
}
