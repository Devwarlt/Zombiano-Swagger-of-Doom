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
 * Created by Fabian on 03.03.2015.
 */
package com.company.assembleegameclient.util {
import com.company.util.Random;

import flash.errors.IllegalOperationError;
import flash.utils.getQualifiedClassName;

public class ArrayUtils {
    private static const random:Random = new Random();

    public static function randomElement(collection:*):* {
        if(collection == null) throw new IllegalOperationError("collection cannot be null");
        if(collection.length == 0) return null;
        if(getQualifiedClassName(collection).indexOf('__AS3__.vec::Vector') == 0 || collection is Array) {
            return collection[random.next(0, collection.length - 1)];
        }
        else throw new IllegalOperationError("collection is not of type Array or Vector");
    }
}
}
