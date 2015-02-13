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

//en_US$formatters_properties

package {
    import mx.resources.ResourceBundle;

    public class en_US$formatters_properties extends ResourceBundle {

        public function en_US$formatters_properties(){
            super("en_US", "formatters");
        }
        override protected function getContent():Object{
            return ({
                "zipCodeFormat":"#####",
                "useNegativeSignInCurrency":"true",
                "useNegativeSignInNumber":"true",
                "defaultInvalidFormatError":"Invalid format",
                "pm":"PM",
                "useThousandsSeparator":"true",
                "am":"AM",
                "areaCode":"-1",
                "validPatternChars":"+()#- .",
                "phoneNumberFormat":"(###) ###-####",
                "defaultInvalidValueError":"Invalid value",
                "areaCodeFormat":"(###)",
                "monthNamesShort":"Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec",
                "numberFormatterPrecision":"-1",
                "dayNamesShort":"Sun,Mon,Tue,Wed,Thu,Fri,Sat",
                "rounding":"none",
                "currencyFormatterPrecision":"-1"
            });
        }

    }
}//package 

