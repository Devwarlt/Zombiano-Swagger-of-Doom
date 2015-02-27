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

//com.company.assembleegameclient.util.TextureRedrawer

package com.company.assembleegameclient.util {
import flash.filters.GlowFilter;
import flash.filters.BitmapFilterQuality;
import flash.utils.Dictionary;
import flash.display.Shape;
import flash.geom.Matrix;
import flash.display.BitmapData;
import flash.utils.ByteArray;
import flash.display.BlendMode;
import flash.display.Bitmap;

import com.company.util.PointUtil;

import flash.geom.Rectangle;
import flash.geom.ColorTransform;

import com.company.util.AssetLibrary;

import flash.display.Shader;
import flash.filters.ShaderFilter;
import flash.display.GradientType;

public class TextureRedrawer {

    private static const BORDER:int = 4;
    private static const GRADIENT_MAX_SUB:uint = 0x282828;
    private static const OUTLINE_FILTER:GlowFilter = new GlowFilter(0, 0.8, 1.4, 1.4, 0xFF, BitmapFilterQuality.LOW, false, false);
    private static const GLOW_FILTER:GlowFilter = new GlowFilter(0, 0.3, 12, 12, 2, BitmapFilterQuality.LOW, false, false);

    private static var cache_:Dictionary = new Dictionary();
    private static var _1d:Dictionary = new Dictionary();
    private static var gradient_:Shape = getGradient();
    private static var drawMatrix_:Matrix = getDrawMatrix();
    private static var tempMatrix_:Matrix = new Matrix();
    public static var _rn:BitmapData = null;
    private static var textureShaderEmbed_:Class = TextureRedrawer_textureShaderEmbed_;
    private static var textureShaderData_:ByteArray = (new textureShaderEmbed_() as ByteArray);
    private static var colorTexture1:BitmapData = new BitmapData(1, 1, false);
    private static var colorTexture2:BitmapData = new BitmapData(1, 1, false);

    public static function redraw(_arg1:BitmapData, _arg2:int, _arg3:Boolean, _arg4:uint, _arg5:uint, _arg6:Boolean = true, _arg7:int = 5):BitmapData {
        var _local8:Dictionary;
        var _local9:BitmapData;
        if (_arg6) {
            _local8 = cache_[_arg2];
            if (_local8 == null) {
                _local8 = new Dictionary();
                cache_[_arg2] = _local8;
            }
            _local9 = _local8[_arg1];
            if (_local9 != null) {
                return (_local9);
            }
        }
        _local9 = resize(_arg1, null, _arg2, _arg3, 0, 0, _arg7);
        _local9 = outlineGlow(_local9, _arg4, _arg5);
        if (_arg6) {
            _local8[_arg1] = _local9;
        }
        return (_local9);
    }

    public static function resize(baseData:BitmapData, mask:BitmapData, size:int, _arg4:Boolean, tex1:int, tex2:int, scaleValue:int = 5):BitmapData {
        if (((!((mask == null))) && (((!((tex1 == 0))) || (!((tex2 == 0))))))) {
            baseData = retexture(baseData, mask, tex1, tex2);
            size = (size / 5);
        }
        var _local8:Number = ((scaleValue * (size / 100)) * baseData.width);
        var _local9:Number = ((scaleValue * (size / 100)) * baseData.height);
        var _local10:Matrix = new Matrix();
        _local10.scale((_local8 / baseData.width), (_local9 / baseData.height));
        _local10.translate(12, 12);
        var _local11:BitmapData = new BitmapData(((_local8 + 12) + 12), ((_local9 + ((_arg4) ? 12 : 1)) + 12), true, 0);
        _local11.draw(baseData, _local10);
        return (_local11);
    }

    public static function outlineGlow(_arg1:BitmapData, _arg2:uint, _arg3:uint):BitmapData {
        var _local4:BitmapData = _arg1.clone();
        tempMatrix_.identity();
        tempMatrix_.scale((_arg1.width / 0x0100), (_arg1.height / 0x0100));
        _local4.draw(gradient_, tempMatrix_, null, BlendMode.SUBTRACT);
        var _local5:Bitmap = new Bitmap(_arg1);
        _local4.draw(_local5, null, null, BlendMode.ALPHA);
        OUTLINE_FILTER.color = _arg2;
        _local4.applyFilter(_local4, _local4.rect, PointUtil._P_5, OUTLINE_FILTER);
        if (_arg3 != 0xFFFFFFFF) {
            GLOW_FILTER.color = _arg3;
            _local4.applyFilter(_local4, _local4.rect, PointUtil._P_5, GLOW_FILTER);
        }
        return (_local4);
    }

    public static function redrawSolidSquare(_arg1:uint, _arg2:int):BitmapData {
        var _local3:Dictionary = cache_[_arg2];
        if (_local3 == null) {
            _local3 = new Dictionary();
            cache_[_arg2] = _local3;
        }
        var _local4:BitmapData = _local3[_arg1];
        if (_local4 != null) {
            return (_local4);
        }
        _local4 = new BitmapData(((_arg2 + 4) + 4), ((_arg2 + 4) + 4), true, 0);
        _local4.fillRect(new Rectangle(4, 4, _arg2, _arg2), (0xFF000000 | _arg1));
        _local4.applyFilter(_local4, _local4.rect, PointUtil._P_5, OUTLINE_FILTER);
        _local3[_arg1] = _local4;
        return (_local4);
    }

    public static function clearCache():void {
        var _local1:BitmapData;
        var _local2:Dictionary;
        var _local3:Dictionary;
        for each (_local2 in cache_) {
            for each (_local1 in _local2) {
                _local1.dispose();
            }
        }
        cache_ = new Dictionary();
        for each (_local3 in _1d) {
            for each (_local1 in _local3) {
                _local1.dispose();
            }
        }
        _1d = new Dictionary();
    }

    public static function _uB_(_arg1:BitmapData, _arg2:Number):BitmapData {
        if (_arg2 == 1) {
            return (_arg1);
        }
        var _local3:Dictionary = _1d[_arg2];
        if (_local3 == null) {
            _local3 = new Dictionary();
            _1d[_arg2] = _local3;
        }
        var _local4:BitmapData = _local3[_arg1];
        if (_local4 != null) {
            return (_local4);
        }
        _local4 = _arg1.clone();
        _local4.colorTransform(_local4.rect, new ColorTransform(_arg2, _arg2, _arg2));
        _local3[_arg1] = _local4;
        return (_local4);
    }

    private static function getTexture(_arg1:int, _arg2:BitmapData):BitmapData {
        var _local3:BitmapData;
        var _local4 = ((_arg1 >> 24) & 0xFF);
        var _local5 = (_arg1 & 0xFFFFFF);
        switch (_local4) {
            case 0:
                return (_arg2);
            case 1:
                _arg2.setPixel(0, 0, _local5);
                return (_arg2);
            case 4:
                return (AssetLibrary._xK_("textile4x4", _local5));
            case 5:
                return (AssetLibrary._xK_("textile5x5", _local5));
            case 9:
                return (AssetLibrary._xK_("textile9x9", _local5));
            case 10:
                return (AssetLibrary._xK_("textile10x10", _local5));
            case 0xFF:
                return (_rn);
        }
        return (null);
    }

    private static function retexture(_arg1:BitmapData, _arg2:BitmapData, _arg3:int, _arg4:int):BitmapData {
        var _local5:Matrix = new Matrix();
        _local5.scale(5, 5);
        var _local6:BitmapData = new BitmapData((_arg1.width * 5), (_arg1.height * 5), true, 0);
        _local6.draw(_arg1, _local5);
        var _local7:BitmapData = getTexture(_arg3, colorTexture1);
        var _local8:BitmapData = getTexture(_arg4, colorTexture2);
        var _local9:Shader = new Shader(textureShaderData_);
        _local9.data.src.input = _local6;
        _local9.data.mask.input = _arg2;
        _local9.data.texture1.input = _local7;
        _local9.data.texture2.input = _local8;
        _local9.data.texture1Size.value = [(((_arg3 == 0)) ? 0 : _local7.width)];
        _local9.data.texture2Size.value = [(((_arg4 == 0)) ? 0 : _local8.width)];
        _local6.applyFilter(_local6, _local6.rect, PointUtil._P_5, new ShaderFilter(_local9));
        return (_local6);
    }

    private static function getGradient():Shape {
        var _local1:Shape = new Shape();
        var _local2:Matrix = new Matrix();
        _local2.createGradientBox(0x0100, 0x0100, (Math.PI / 2), 0, 0);
        _local1.graphics.beginGradientFill(GradientType.LINEAR, [0, GRADIENT_MAX_SUB], [1, 1], [127, 0xFF], _local2);
        _local1.graphics.drawRect(0, 0, 0x0100, 0x0100);
        _local1.graphics.endFill();
        return (_local1);
    }

    private static function getDrawMatrix():Matrix {
        var _local1:Matrix = new Matrix();
        _local1.scale(8, 8);
        _local1.translate(BORDER, BORDER);
        return (_local1);
    }

}
}//package com.company.assembleegameclient.util

