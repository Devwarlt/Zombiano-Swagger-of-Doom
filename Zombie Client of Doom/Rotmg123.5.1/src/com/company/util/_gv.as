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

//com.company.util._gv

package com.company.util {
import flash.system.Capabilities;

public class _gv {

    public static function _00f():String {
        return (_N_c("avHardwareDisable") + _N_c("hasAccessibility") + _N_c("hasAudio") + _N_c("hasAudioEncoder") + _N_c("hasEmbeddedVideo") + _N_c("hasIME") + _N_c("hasMP3") + _N_c("hasPrinting") + _N_c("hasScreenBroadcast") + _N_c("hasScreenPlayback") + _N_c("hasStreamingAudio") + _N_c("hasStreamingVideo") + _N_c("hasTLS") + _N_c("hasVideoEncoder") + _N_c("isDebugger") + _N_c("language") + _N_c("localFileReadDisable") + _N_c("manufacturer") + _N_c("os") + _N_c("pixelAspectRatio") + _N_c("playerType") + _N_c("screenColor") + _N_c("screenDPI") + _N_c("screenResolutionX") + _N_c("screenResolutionY") + _N_c("version"));
    }

    private static function _N_c(_arg1:String):String {
        return ((((_arg1 + ": ") + Capabilities[_arg1]) + "\n"));
    }

}
}//package com.company.util

