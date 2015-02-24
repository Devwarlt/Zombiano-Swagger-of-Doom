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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.util.loadEmbeds

package com.company.assembleegameclient.util{
import AccountManagement.images.AccountManagementImages;

import Sounds.LocalSounds;

import Effects._0H_Y_;
    
    import Sounds.UrlSoundEffects;
    import Sounds._Q_P_;
    import Sounds.Music;

import _F_1.MapInfoBackgrounds;

import com.company.assembleegameclient.engine3d._B_5;
    import com.company.assembleegameclient.map._pf;
    import com.company.assembleegameclient.map._sn;
    import com.company.assembleegameclient.objects.ObjectLibrary;
    import com.company.assembleegameclient.parameters.Parameters;
    import com.company.util.AssetLibrary;
    
    import flash.display.BitmapData;
    import flash.utils.ByteArray;

    public function loadEmbeds():void{
        var _local2:String;
        var _local3:*;
        var _local4:*;
        var _local5:*;
        var _local6:ByteArray;
        var _local7:String;
        AssetLibrary._05q("lofiChar8x8", new Embeds.lofiCharEmbed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiChar16x8", new Embeds.lofiCharEmbed_().bitmapData, 16, 8);
        AssetLibrary._05q("lofiChar16x16", new Embeds.lofiCharEmbed_().bitmapData, 16, 16);
        AssetLibrary._05q("lofiChar28x8", new Embeds.lofiChar2Embed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiChar216x8", new Embeds.lofiChar2Embed_().bitmapData, 16, 8);
        AssetLibrary._05q("lofiChar216x16", new Embeds.lofiChar2Embed_().bitmapData, 16, 16);
        AssetLibrary._05q("lofiCharBig", new Embeds.lofiCharBigEmbed_().bitmapData, 16, 16);
        AssetLibrary._05q("lofiEnvironment", new Embeds.lofiEnvironmentEmbed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiEnvironment2", new Embeds.lofiEnvironment2Embed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiEnvironment3", new Embeds.lofiEnvironment3Embed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiInterface", new Embeds.lofiInterfaceEmbed_().bitmapData, 8, 8);
        AssetLibrary._05q("redLootBag", new Embeds.redLootBagEmbed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiInterfaceBig", new Embeds.lofiInterfaceBigEmbed_().bitmapData, 32, 32);
        AssetLibrary._05q("lofiInterface2", new Embeds.lofiInterface2Embed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiObj", new Embeds.lofiObjEmbed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiObj2", new Embeds.lofiObj2Embed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiObj3", new Embeds.lofiObj3Embed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiObj4", new Embeds.lofiObj4Embed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiObj5", new Embeds.lofiObj5Embed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiObj6", new Embeds.lofiObj6Embed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiObjBig", new Embeds.lofiObjBigEmbed_().bitmapData, 16, 16);
        AssetLibrary._05q("lofiObj40x40", new Embeds.lofiObj40x40Embed_().bitmapData, 40, 40);
        AssetLibrary._05q("lofiProjs", new Embeds.lofiProjsEmbed_().bitmapData, 8, 8);
        AssetLibrary._05q("lofiProjsBig", new Embeds.lofiProjsBigEmbed_().bitmapData, 16, 16);
        AssetLibrary._05q("lofiParts", new Embeds.lofiPartsEmbed_().bitmapData, 8, 8);
        AssetLibrary._05q("stars", new Embeds.starsEmbed_().bitmapData, 5, 5);
        AssetLibrary._05q("rain", new Embeds.rainEmbed_().bitmapData, 5, 5);
        AssetLibrary._05q("textile4x4", new Embeds.textile4x4Embed_().bitmapData, 4, 4);
        AssetLibrary._05q("textile5x5", new Embeds.textile5x5Embed_().bitmapData, 5, 5);
        AssetLibrary._05q("textile9x9", new Embeds.textile9x9Embed_().bitmapData, 9, 9);
        AssetLibrary._05q("textile10x10", new Embeds.textile10x10Embed_().bitmapData, 10, 10);
        AssetLibrary._05q("inner_mask", new Embeds.innerMaskEmbed_().bitmapData, 4, 4);
        AssetLibrary._05q("sides_mask", new Embeds.sidesMaskEmbed_().bitmapData, 4, 4);
        AssetLibrary._05q("outer_mask", new Embeds.outerMaskEmbed_().bitmapData, 4, 4);
        AssetLibrary._05q("innerP1_mask", new Embeds.innerP1MaskEmbed_().bitmapData, 4, 4);
        AssetLibrary._05q("innerP2_mask", new Embeds.innerP2MaskEmbed_().bitmapData, 4, 4);
        AssetLibrary._05q("weapons40x40", new Embeds.weaponsEmbed40x40_().bitmapData, 40, 40);
        AssetLibrary._05q("craftingBook", new Embeds.craftingBookEmbed_().bitmapData, 40, 40);
        AssetLibrary._05q("batteryCharges", new Embeds.batteryChargedEmbed_().bitmapData, 16, 16);
        AssetLibrary._05q("anna", new Embeds.testImage().bitmapData, 640, 480);
        AssetLibrary._05q("carbonFibre", new Embeds.carbon().bitmapData, 256, 256);
        AssetLibrary._05q("openFirePacks", new AccountManagementImages.openFirePacks().bitmapData, 80, 80);
        AssetLibrary._05q("coins", new Embeds.coins().bitmapData, 8, 8);
        var _local1:BitmapData = new BitmapData(8, 8, true, 0);
        AssetLibrary._05q("invisible", _local1, 8, 8);
        _0B_c.add("chars8x8rBeach", new Embeds.chars8x8rBeachEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
        _0B_c.add("chars8x8dBeach", new Embeds.chars8x8dBeachEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.DOWN);
        _0B_c.add("chars8x8rLow1", new Embeds.chars8x8rLow1Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
        _0B_c.add("chars8x8rLow2", new Embeds.chars8x8rLow2Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
        _0B_c.add("chars8x8rMid", new Embeds.chars8x8rMidEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
        _0B_c.add("chars8x8rMid2", new Embeds.chars8x8rMid2Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
        _0B_c.add("chars8x8rHigh", new Embeds.chars8x8rHighEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
        _0B_c.add("chars8x8rHero1", new Embeds.chars8x8rHero1Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
        _0B_c.add("chars8x8rHero2", new Embeds.chars8x8rHero2Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
        _0B_c.add("chars8x8dHero1", new Embeds.chars8x8dHero1Embed_().bitmapData, null, 8, 8, 56, 8, _lJ_.DOWN);
        _0B_c.add("chars16x16dMountains1", new Embeds.chars16x16dMountains1Embed_().bitmapData, null, 16, 16, 112, 16, _lJ_.DOWN);
        _0B_c.add("chars16x16dMountains2", new Embeds.chars16x16dMountains2Embed_().bitmapData, null, 16, 16, 112, 16, _lJ_.DOWN);
        _0B_c.add("chars8x8dEncounters", new Embeds.chars8x8dEncountersEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.DOWN);
        _0B_c.add("chars8x8rEncounters", new Embeds.chars8x8rEncountersEmbed_().bitmapData, null, 8, 8, 56, 8, _lJ_.RIGHT);
        _0B_c.add("chars16x8dEncounters", new Embeds.chars16x8dEncountersEmbed_().bitmapData, null, 16, 8, 112, 8, _lJ_.DOWN);
        _0B_c.add("chars16x8rEncounters", new Embeds.chars16x8rEncountersEmbed_().bitmapData, null, 16, 8, 112, 8, _lJ_.DOWN);
        _0B_c.add("chars16x16dEncounters", new Embeds.chars16x16dEncountersEmbed_().bitmapData, null, 16, 16, 112, 16, _lJ_.DOWN);
        _0B_c.add("chars16x16dEncounters2", new Embeds.chars16x16dEncounters2Embed_().bitmapData, null, 16, 16, 112, 16, _lJ_.DOWN);
        _0B_c.add("chars16x16rEncounters", new Embeds.chars16x16rEncountersEmbed_().bitmapData, null, 16, 16, 112, 16, _lJ_.RIGHT);
        _0B_c.add("players", new Embeds.playersEmbed_().bitmapData, new Embeds.playersMaskEmbed_().bitmapData, 8, 8, 56, 24, _lJ_.RIGHT);
		_0B_c.add("playerskins", new Embeds.playerSkinsEmbed_().bitmapData, new Embeds.playerSkinsMaskEmbed_().bitmapData, 8, 8, 56, 24, _lJ_.RIGHT);
        _0B_c.add("playerskins16x16", new Embeds.playerSkins16x16Embed_().bitmapData, null, 16, 16, 112, 2000, _lJ_.RIGHT);
        _0B_c.add("chars8x8rPets1", new Embeds.chars8x8rPets1Embed_().bitmapData, new Embeds.chars8x8rPets1MaskEmbed_().bitmapData, 8, 8, 56, 8, _lJ_.RIGHT);
        UrlSoundEffects.load("button_click");
        UrlSoundEffects.load("death_screen");
        UrlSoundEffects.load("enter_realm");
        UrlSoundEffects.load("error");
        UrlSoundEffects.load("inventory_move_item");
        UrlSoundEffects.load("level_up");
        UrlSoundEffects.load("loot_appears");
        UrlSoundEffects.load("no_mana");
        UrlSoundEffects.load("use_key");
        UrlSoundEffects.load("use_potion");

        for (_local2 in Embeds.models_)
        {
            _local6 = Embeds.models_[_local2];
            _local7 = _local6.readUTFBytes(_local6.length);
            _B_5._08y(_local2, _local7);
        }
        _0H_Y_._nY_(Embeds.particlesXML);
        for each (_local3 in _H_f._R_k)
        {
            _pf._nY_(XML(_local3));
        }
        for each (_local4 in _H_f._use)
        {
            ObjectLibrary._nY_(XML(_local4));
        }
        for each (_local5 in _H_f._l5)
        {
            _sn._nY_(XML(_local5));
        }
        Parameters.load();
        Music.load();
        _Q_P_.load();
        MapInfoBackgrounds.load();
        LocalSounds.load();
    }
}

import FireBite.Embeds.Images.Embeds_Coins;
import FireBite.Embeds.Images.Embeds_chars16x16dEncounters2Embed_;
import FireBite.Embeds.Images.Embeds_chars16x16dEncountersEmbed_;
import FireBite.Embeds.Images.Embeds_chars16x16dMountains1Embed_;
import FireBite.Embeds.Images.Embeds_chars16x16dMountains2Embed_;
import FireBite.Embeds.Images.Embeds_chars16x16rEncountersEmbed_;
import FireBite.Embeds.Images.Embeds_chars16x8dEncountersEmbed_;
import FireBite.Embeds.Images.Embeds_chars16x8rEncountersEmbed_;
import FireBite.Embeds.Images.Embeds_chars8x8dBeachEmbed_;
import FireBite.Embeds.Images.Embeds_chars8x8dEncountersEmbed_;
import FireBite.Embeds.Images.Embeds_chars8x8dHero1Embed_;
import FireBite.Embeds.Images.Embeds_chars8x8rBeachEmbed_;
import FireBite.Embeds.Images.Embeds_chars8x8rEncountersEmbed_;
import FireBite.Embeds.Images.Embeds_chars8x8rHero1Embed_;
import FireBite.Embeds.Images.Embeds_chars8x8rHero2Embed_;
import FireBite.Embeds.Images.Embeds_chars8x8rHighEmbed_;
import FireBite.Embeds.Images.Embeds_chars8x8rLow1Embed_;
import FireBite.Embeds.Images.Embeds_chars8x8rLow2Embed_;
import FireBite.Embeds.Images.Embeds_chars8x8rMid2Embed_;
import FireBite.Embeds.Images.Embeds_chars8x8rMidEmbed_;
import FireBite.Embeds.Images.Embeds_chars8x8rPets1Embed_;
import FireBite.Embeds.Images.Embeds_chars8x8rPets1MaskEmbed_;
import FireBite.Embeds.Images.Embeds_chars8x8rPetsKaratePenguin_;
import FireBite.Embeds.Images.Embeds_innerP1MaskEmbed_;
import FireBite.Embeds.Images.Embeds_innerP2MaskEmbed_;
import FireBite.Embeds.Images.Embeds_lofiChar2Embed_;
import FireBite.Embeds.Images.Embeds_lofiCharEmbed_;
import FireBite.Embeds.Images.Embeds_lofiEnvironment2Embed_;
import FireBite.Embeds.Images.Embeds_lofiEnvironment3Embed_;
import FireBite.Embeds.Images.Embeds_lofiEnvironmentEmbed_;
import FireBite.Embeds.Images.Embeds_lofiInterfaceEmbed_;
import FireBite.Embeds.Images.Embeds_lofiObj2Embed_;
import FireBite.Embeds.Images.Embeds_lofiObj3Embed_;
import FireBite.Embeds.Images.Embeds_lofiObj40x40Embed_;
import FireBite.Embeds.Images.Embeds_lofiObj4Embed_;
import FireBite.Embeds.Images.Embeds_lofiObj5Embed_;
import FireBite.Embeds.Images.Embeds_lofiObj6Embed_;
import FireBite.Embeds.Images.Embeds_lofiObjEmbed_;
import FireBite.Embeds.Images.Embeds_weapons40x40Embed_;
import FireBite.Embeds.Images.PlayerSkins16x16;
import FireBite.Embeds.Images._09C_;
import FireBite.Embeds.Images._0L_i;
import FireBite.Embeds.Images._0M_D_;
import FireBite.Embeds.Images._9V_;
import FireBite.Embeds.Images._E_K_;
import FireBite.Embeds.Images._O_H_;
import FireBite.Embeds.Images._U_0;
import FireBite.Embeds.Images._W_r;
import FireBite.Embeds.Images._Z_F_;
import FireBite.Embeds.Images._hU_;
import FireBite.Embeds.Images._p1;
import FireBite.Embeds.Images._qd;
import FireBite.Embeds.Images._tI_;
import FireBite.Embeds.Images.batteryChargedEmbed;
import FireBite.Embeds.Models.Embed_Squatty3Side;
import FireBite.Embeds.Models.Embeds_Tetrahedron;
import FireBite.Embeds.Models.Embeds_monsterTank1Embed_;
import FireBite.Embeds.Models.Embeds_monsterTank2Embed_;
import FireBite.Embeds.Models.Embeds_monsterTank3Embed_;
import FireBite.Embeds.Models.Embeds_monsterTank4Embed_;
import FireBite.Embeds.Images.Embeds_playerSkinsEmbed_;
import FireBite.Embeds.Images.Embeds_playerSkinsMaskEmbed_;
import FireBite.Embeds.Images.Embeds_rainEmbed_;
import FireBite.Embeds.Images.Embeds_starsEmbed_;
import FireBite.Embeds.Images.Embeds_textile10x10Embed_;
import FireBite.Embeds.Images.Embeds_textile4x4Embed_;
import FireBite.Embeds.Images.Embeds_textile5x5Embed_;
import FireBite.Embeds.Images.Embeds_textile9x9Embed_;
import FireBite.Embeds.Images.craftingBookEmbed;
//import FireBite.Embeds.Models.FarmHouse;
import FireBite.Embeds.Models._03V_;
import FireBite.Embeds.Models._09R_;
import FireBite.Embeds.Models._0B_D_;
import FireBite.Embeds.Models._0G_4;
import FireBite.Embeds.Models._33;
import FireBite.Embeds.Models._3o;
import FireBite.Embeds.Models._E_W_;
import FireBite.Embeds.Models._J_C_;
import FireBite.Embeds.Models._S_5;
import FireBite.Embeds.Models._W_B_;
import FireBite.Embeds.Models._X_h;
import FireBite.Embeds.Models._br;
import FireBite.Embeds.Models._eR_;
import FireBite.Embeds.Models._gO_;
import FireBite.Embeds.Models._l3;
import FireBite.Embeds.Models._nn;
import FireBite.Embeds.Models._qC_;
import FireBite.Embeds.Models._ve;
import FireBite.Embeds.Models._xJ_;
import FireBite.Embeds.Models.skyscraper;
//import FireBite.Embeds.Models.tradeTent1;

import FireBite.Embeds.Images.Embeds_lofiCharEmbed_;

import com.embeds.EmbeddedAssets_testImageEmbed_;

//package com.company.assembleegameclient.util

class Embeds {

    public static var particlesXML:XML = <Particles>
	<Particle id="SwirlingMist">
		<Texture><File>lofiParts</File><Index>0x00</Index></Texture>
		<Animation prob=".5" period="0">
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x01</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x02</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x03</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x04</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x05</Index></Texture></Frame>
			
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x06</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x00</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x07</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x08</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x09</Index></Texture></Frame>
			
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x0a</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x0b</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x0c</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x0d</Index></Texture></Frame>
			<Frame time="1"><Texture><File>invisible</File><Index>0</Index></Texture></Frame>
		</Animation>
		<Animation prob=".5" period="0">
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x01</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x03</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x04</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x05</Index></Texture></Frame>
	
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x06</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x07</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x08</Index></Texture></Frame>
			
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x0a</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x0b</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x0c</Index></Texture></Frame>
			<Frame time="0.2"><Texture><File>lofiParts</File><Index>0x0d</Index></Texture></Frame>
			<Frame time="1.2"><Texture><File>invisible</File><Index>0</Index></Texture></Frame>
		</Animation>
		<Size>100</Size>
		<Z>0.2</Z>
		<Flying/>
		<Duration>3.0</Duration>
		<Movement speed="0.1">RandomDirection</Movement>
	</Particle>
</Particles>
    ;
    public static var lofiCharEmbed_:Class = Embeds_lofiCharEmbed_;
    public static var lofiChar2Embed_:Class = Embeds_lofiChar2Embed_;
    public static var lofiCharBigEmbed_:Class = _hU_;
    public static var lofiEnvironmentEmbed_:Class = Embeds_lofiEnvironmentEmbed_;
    public static var lofiEnvironment2Embed_:Class = Embeds_lofiEnvironment2Embed_;
    public static var lofiEnvironment3Embed_:Class = Embeds_lofiEnvironment3Embed_;
    public static var lofiInterfaceEmbed_:Class = Embeds_lofiInterfaceEmbed_;
    public static var lofiInterfaceBigEmbed_:Class = _0L_i;
    public static var lofiInterface2Embed_:Class = _qd;
    public static var lofiObjEmbed_:Class = Embeds_lofiObjEmbed_;
    public static var lofiObj2Embed_:Class = Embeds_lofiObj2Embed_;
    public static var lofiObj3Embed_:Class = Embeds_lofiObj3Embed_;
    public static var lofiObj4Embed_:Class = Embeds_lofiObj4Embed_;
    public static var lofiObj5Embed_:Class = Embeds_lofiObj5Embed_;
    public static var lofiObj6Embed_:Class = Embeds_lofiObj6Embed_;
    public static var lofiObjBigEmbed_:Class = _p1;
    public static var lofiObj40x40Embed_:Class = Embeds_lofiObj40x40Embed_;
    public static var lofiProjsEmbed_:Class = _E_K_;
    public static var lofiProjsBigEmbed_:Class = _0M_D_;
    public static var lofiPartsEmbed_:Class = _O_H_;
    public static var chars8x8rBeachEmbed_:Class = Embeds_chars8x8rBeachEmbed_;
    public static var chars8x8dBeachEmbed_:Class = Embeds_chars8x8dBeachEmbed_;
    public static var chars8x8rLow1Embed_:Class = Embeds_chars8x8rLow1Embed_;
    public static var chars8x8rLow2Embed_:Class = Embeds_chars8x8rLow2Embed_;
    public static var chars8x8rMidEmbed_:Class = Embeds_chars8x8rMidEmbed_;
    public static var chars8x8rMid2Embed_:Class = Embeds_chars8x8rMid2Embed_;
    public static var chars8x8rHighEmbed_:Class = Embeds_chars8x8rHighEmbed_;
    public static var chars8x8rHero1Embed_:Class = Embeds_chars8x8rHero1Embed_;
    public static var chars8x8rHero2Embed_:Class = Embeds_chars8x8rHero2Embed_;
    public static var chars8x8dHero1Embed_:Class = Embeds_chars8x8dHero1Embed_;
    public static var chars16x16dMountains1Embed_:Class = Embeds_chars16x16dMountains1Embed_;
    public static var chars16x16dMountains2Embed_:Class = Embeds_chars16x16dMountains2Embed_;
    public static var chars8x8dEncountersEmbed_:Class = Embeds_chars8x8dEncountersEmbed_;
    public static var chars8x8rEncountersEmbed_:Class = Embeds_chars8x8rEncountersEmbed_;
    public static var chars16x8dEncountersEmbed_:Class = Embeds_chars16x8dEncountersEmbed_;
    public static var chars16x8rEncountersEmbed_:Class = Embeds_chars16x8rEncountersEmbed_;
    public static var chars16x16dEncountersEmbed_:Class = Embeds_chars16x16dEncountersEmbed_;
    public static var chars16x16dEncounters2Embed_:Class = Embeds_chars16x16dEncounters2Embed_;
    public static var chars16x16rEncountersEmbed_:Class = Embeds_chars16x16rEncountersEmbed_;
    public static var playersEmbed_:Class = _U_0;
    public static var playersMaskEmbed_:Class = _tI_;
	public static var playerSkinsEmbed_:Class = Embeds_playerSkinsEmbed_;
	public static var playerSkins16x16Embed_:Class = PlayerSkins16x16;
	public static var playerSkinsMaskEmbed_:Class = Embeds_playerSkinsMaskEmbed_;
    public static var chars8x8rPets1Embed_:Class = Embeds_chars8x8rPets1Embed_;
    public static var chars8x8rPets1MaskEmbed_:Class = Embeds_chars8x8rPets1MaskEmbed_;
    public static var chars8x8rPetsKaratePenguin_:Class = Embeds_chars8x8rPetsKaratePenguin_;
    public static var redLootBagEmbed_:Class = _Z_F_;
    public static var starsEmbed_:Class = Embeds_starsEmbed_;
    public static var rainEmbed_:Class = Embeds_rainEmbed_;
    public static var textile4x4Embed_:Class = Embeds_textile4x4Embed_;
    public static var textile5x5Embed_:Class = Embeds_textile5x5Embed_;
    public static var textile9x9Embed_:Class = Embeds_textile9x9Embed_;
    public static var textile10x10Embed_:Class = Embeds_textile10x10Embed_;
    public static var innerMaskEmbed_:Class = _09C_;
    public static var sidesMaskEmbed_:Class = _W_r;
    public static var outerMaskEmbed_:Class = _9V_;
    public static var innerP1MaskEmbed_:Class = Embeds_innerP1MaskEmbed_;
    public static var innerP2MaskEmbed_:Class = Embeds_innerP2MaskEmbed_;

    public static var weaponsEmbed40x40_:Class = Embeds_weapons40x40Embed_;
    public static var craftingBookEmbed_:Class = craftingBookEmbed;
    public static var batteryChargedEmbed_:Class = batteryChargedEmbed;
    public static var testImage:Class = com.embeds.EmbeddedAssets_testImageEmbed_;
    public static var carbon:Class = com.embeds.carbonEmbed;
    public static var coins:Class = Embeds_Coins;


    /*private*/ internal static var monsterTank1Embed_:Class = Embeds_monsterTank1Embed_;
    /*private*/ internal static var monsterTank2Embed_:Class = Embeds_monsterTank2Embed_;
    /*private*/ internal static var monsterTank3Embed_:Class = Embeds_monsterTank3Embed_;
    /*private*/ internal static var monsterTank4Embed_:Class = Embeds_monsterTank4Embed_;
    /*private*/ internal static var labTankEmbed_:Class = _ve;
    /*private*/ internal static var teslaEmbed_:Class = _33;
    /*private*/ internal static var gasEmitter_:Class = _W_B_;
    /*private*/ internal static var cloningVatEmbed_:Class = _qC_;
    /*private*/ internal static var crateEmbed_:Class = _3o;
    /*private*/ internal static var cubeEmbed_:Class = _eR_;
    /*private*/ internal static var bigcubeEmbed_:Class = _0B_D_;
    /*private*/ internal static var icosahedronEmbed_:Class = _S_5;
    /*private*/ internal static var octahedronEmbed_:Class = _l3;
    /*private*/ internal static var pyramidEmbed_:Class = _xJ_;
                internal static var skyscaperEmbed_:Class = skyscraper;
                //internal static var tradeTendEmbed_:Class = tradeTent1;
                //internal static var farmHouseEmbed_:Class = FarmHouse;
    /*private*/ internal static var tetrahedronEmbed_:Class = Embeds_Tetrahedron;
    /*private*/ internal static var dodecahedronEmbed_:Class = _nn;
    /*private*/ internal static var pillarEmbed_:Class = _J_C_;
    /*private*/ internal static var brokenPillarEmbed_:Class = _09R_;
    /*private*/ internal static var towerEmbed_:Class = _X_h;
    /*private*/ internal static var obeliskEmbed_:Class = _03V_;
    /*private*/ internal static var tableEmbed_:Class = _E_W_;
    /*private*/ internal static var tableEdgeEmbed_:Class = _gO_;
    /*private*/ internal static var signEmbed_:Class = _br;
    /*private*/ internal static var webEmbed_:Class = _0G_4;
    internal static var squatty3Side:Class = Embed_Squatty3Side;
    public static var models_:Object = {
        "Monster Tank1":new monsterTank1Embed_(),
        "Monster Tank2":new monsterTank2Embed_(),
        "Monster Tank3":new monsterTank3Embed_(),
        "Monster Tank4":new monsterTank4Embed_(),
        "GasEmitter":new gasEmitter_(),
        "Lab Tank":new labTankEmbed_(),
        "Tesla":new teslaEmbed_(),
        "CloningVat":new cloningVatEmbed_(),
        "Crate":new crateEmbed_(),
        "Cube":new cubeEmbed_(),
        "Big Cube":new bigcubeEmbed_(),
        "Ico":new icosahedronEmbed_(),
        "Octa":new octahedronEmbed_(),
        "Pyramid":new pyramidEmbed_(),
        "Tetra":new tetrahedronEmbed_(),
        "Dodec":new dodecahedronEmbed_(),
        "Pillar":new pillarEmbed_(),
        "Broken Pillar":new brokenPillarEmbed_(),
        "Tower":new towerEmbed_(),
        "Obelisk":new obeliskEmbed_(),
        "Table":new tableEmbed_(),
        "Table Edge":new tableEdgeEmbed_(),
        "Sign":new signEmbed_(),
        "Web":new webEmbed_(),
        "Skyscraper":new skyscaperEmbed_(),
        "Squatty3Side":new squatty3Side()
        //"TradeTent":new tradeTendEmbed_(),
        //"FarmHouse":new farmHouseEmbed_()
    };

}

