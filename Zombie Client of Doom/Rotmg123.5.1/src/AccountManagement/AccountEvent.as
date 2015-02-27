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

//AccountWebrequests._nJ_

package AccountManagement {
import flash.events.Event;

public class AccountEvent extends Event {

    public static const DONE:String = "ACCOUNT_DONE";
    public static const CURRENT:String = "ACCOUNT_CURRENT";
    public static const REGISTER:String = "ACCOUNT_REGISTER";
    public static const SIGN_IN:String = "ACCOUNT_SIGN_IN";
    public static const FORGOT:String = "ACCOUNT_FORGOT";
    public static const CHANGE:String = "ACCOUNT_CHANGE";
    public static const SUCCESS:String = "ACCOUNT_SUCCESS";

    public function AccountEvent(_arg1:String) {
        super(_arg1);
    }
}
}//package AccountWebrequests

