﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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

//com.company.assembleegameclient.util._H_f

package com.company.assembleegameclient.util {
import FireBite.Embeds.CXML.Cloth;
import FireBite.Embeds.CXML.Dyes;
import FireBite.Embeds.CXML.GroundTiles;
import FireBite.Embeds.CXML.PetGenerators;
import FireBite.Embeds.CXML.Projectiles;
import FireBite.Embeds.CXML.Regions;
import FireBite.Embeds.CXML.Special;
import FireBite.Embeds.CXML.Specials2;
import FireBite.Embeds.CXML.TutorialUI;
import FireBite.Embeds.CXML.Objects;
import FireBite.Embeds.CXML.players;
import FireBite.Embeds.CXML.skins;
import FireBite.Embeds.CXML.tutorialObjects;

public class _H_f {

    private static const _Q_N_:Class = GroundTiles;
    public static const _R_k:Array = [new _Q_N_()];
    private static const _dv:Class = Projectiles;
    private static const _0I_f:Class = _y8;
    private static const _R_p:Class = Dyes;
    private static const _0E_3:Class = Cloth;
    private static const __if:Class = PetGenerators;
    private static const _84:Class = _T_r;
    private static const _0L_x:Class = players;
    private static const _0F_L_:Class = Special;
    private static const _h9:Class = Objects;
    private static const _0J_O_:Class = tutorialObjects;
    private static const _xf:Class = _V_E_;
    private static const _bp:Class = _P_0;
    private static const specials2:Class = Specials2;
    private static const skins_:Class = skins;
    public static const _use:Array =
            [
                new _dv(),
                new _0I_f(),
                new _R_p(),
                new _0E_3(),
                new __if(),
                new _84(),
                new _0L_x(),
                new _0F_L_(),
                new _h9(),
                new _0J_O_(),
                new _xf(),
                new _bp(),
                new specials2(),
                new skins_()
            ];
    private static const _uX_:Class = Regions;
    public static const _l5:Array = [new _uX_()];
    private static const _J_T_:Class = TutorialUI;
    public static const _3H_:XML = XML(new _J_T_());

}
}//package com.company.assembleegameclient.util

