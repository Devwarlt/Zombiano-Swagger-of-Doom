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

//com.hurlant.crypto.tls.TLSError

package com.hurlant.crypto.tls {
public class TLSError extends Error {

    public static const close_notify:uint = 0;
    public static const unexpected_message:uint = 10;
    public static const bad_record_mac:uint = 20;
    public static const decryption_failed:uint = 21;
    public static const record_overflow:uint = 22;
    public static const decompression_failure:uint = 30;
    public static const handshake_failure:uint = 40;
    public static const bad_certificate:uint = 42;
    public static const unsupported_certificate:uint = 43;
    public static const certificate_revoked:uint = 44;
    public static const certificate_expired:uint = 45;
    public static const certificate_unknown:uint = 46;
    public static const illegal_parameter:uint = 47;
    public static const unknown_ca:uint = 48;
    public static const access_denied:uint = 49;
    public static const decode_error:uint = 50;
    public static const decrypt_error:uint = 51;
    public static const protocol_version:uint = 70;
    public static const insufficient_security:uint = 71;
    public static const internal_error:uint = 80;
    public static const user_canceled:uint = 90;
    public static const no_renegotiation:uint = 100;

    public function TLSError(_arg1:String, _arg2:int) {
        super(_arg1, _arg2);
    }
}
}//package com.hurlant.crypto.tls

