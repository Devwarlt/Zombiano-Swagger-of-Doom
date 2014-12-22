/**
 * Created by Fabian on 30.11.2014.
 */
package PopUps {
import Sounds.UrlSoundEffects;

import _05R_.GTween;

import com.company.assembleegameclient.game.GameSprite;

import com.company.assembleegameclient.util.RankUtils;
import com.company.ui.SimpleText;

import flash.display.DisplayObject;
import flash.filters.DropShadowFilter;

public class YouHaveBeenPromotedPopUp extends PopUpScreen {

    private var promotionText:SimpleText;
    private var rankText:SimpleText;
    private var rankIcon:DisplayObject;
    private var rank:int;

    public function YouHaveBeenPromotedPopUp(gameSprite:GameSprite, rank:int) {
        this.rank = rank;
        super(gameSprite);
    }

    protected override function init():void {
        this.promotionText = new SimpleText(46, 0xFFFFFF, false, 0, 600);
        this.promotionText.text = "You have been Promoted.";
        this.promotionText.filters = [new DropShadowFilter(0, 0, 0, 1, 10, 10, 2.0)];
        this.promotionText.x = 0;
        this.promotionText.y = 50;
        this.promotionText.size = 0;

        this.rankIcon = RankUtils._03A_(rank);
        this.rankIcon.y = 110;
        this.rankIcon.scaleX = 0;
        this.rankIcon.scaleY = 0;
        this.rankIcon.filters = [new DropShadowFilter(0, 0, 0, 1, 10, 10, 2.0)];

        this.rankText = new SimpleText(32, 0xFFFFFF, false, 0, 600);
        this.rankText.text = RankUtils.toLongRankString(rank) + " (" + RankUtils.toShortRankString(rank) + ")";
        this.rankText.filters = [new DropShadowFilter(0, 0, 0, 1, 10, 10, 2.0)];
        this.rankText.x = 0;
        this.rankText.y = 200;
        this.rankText.size = 0;

        UrlSoundEffects.play("promoted", 1, true, true);
        stage.addChild(promotionText);
        var tween:GTween = new GTween(this.promotionText, 0.5, { "size": 46 });
        tween._bR_ = updateMetrics;
        tween.onComplete = iconFadeIn;
    }

    private function updateMetrics(tween:GTween):void {
        this.promotionText.x = 300 - (this.promotionText.textWidth / 2);
        this.rankIcon.x = 300 - (this.rankIcon.width / 2);
        this.rankText.y = this.rankIcon.y + this.rankIcon.height + 20;
        this.rankText.x = 300 - (this.rankText.textWidth / 2);
    }

    private function iconFadeIn(tween:GTween):void {
        stage.addChild(rankIcon);
        tween = new GTween(this.rankIcon, 0.5, { "scaleX": 0.5, "scaleY": 0.5 });
        tween._bR_ = updateMetrics;
        tween.onComplete = rankTextFadeIn;
    }

    private function rankTextFadeIn(tween:GTween):void {
        stage.addChild(rankText);
        tween = new GTween(this.rankText, 0.3, { "size": 32 });
        tween._bR_ = updateMetrics;
        tween.onComplete = waitForFadeOut;
    }

    private function waitForFadeOut(tween:GTween):void {
        tween = new GTween(null, 10);
        tween.onComplete = fadeOut;
    }

    private function fadeOut(tween:GTween):void {
        var descTween = new GTween(this.rankText, 0.3, { "size": 0 });
        var iconTween = new GTween(this.rankIcon, 0.3, { "scaleX": 0, "scaleY": 0 });
        var textTween = new GTween(this.promotionText, 0.3, { "size": 0 });
        textTween._bR_ = updateMetrics;
        textTween.onComplete = remove;
    }

    private function remove(tween:GTween):void {
        stage.removeChild(this.rankText);
        stage.removeChild(this.rankIcon);
        stage.removeChild(this.promotionText);
        parent.removeChild(this);
    }
}
}
