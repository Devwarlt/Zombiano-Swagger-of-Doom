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

//avmplus.DescribeTypeJSON

package avmplus{
    public class DescribeTypeJSON {

        public static const INSTANCE_FLAGS:uint = (((((((((INCLUDE_BASES | INCLUDE_INTERFACES) | INCLUDE_VARIABLES) | INCLUDE_ACCESSORS) | INCLUDE_METHODS) | INCLUDE_METADATA) | INCLUDE_CONSTRUCTOR) | INCLUDE_TRAITS) | USE_ITRAITS) | HIDE_OBJECT);
        public static const CLASS_FLAGS:uint = ((((((INCLUDE_INTERFACES | INCLUDE_VARIABLES) | INCLUDE_ACCESSORS) | INCLUDE_METHODS) | INCLUDE_METADATA) | INCLUDE_TRAITS) | HIDE_OBJECT);

        public static var available:Boolean = !((describeTypeJSON == null));

        public function describeType(_arg1:Object, _arg2:uint):Object{
            return (describeTypeJSON(_arg1, _arg2));
        }
        public function getInstanceDescription(_arg1:Class):Object{
            return (describeTypeJSON(_arg1, INSTANCE_FLAGS));
        }
        public function getClassDescription(_arg1:Class):Object{
            return (describeTypeJSON(_arg1, CLASS_FLAGS));
        }

    }
}//package avmplus

