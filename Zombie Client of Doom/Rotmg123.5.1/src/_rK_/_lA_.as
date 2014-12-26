// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_rK_._lA_

package _rK_{
    import _0L_C_.DialogBox;
    import flash.events.Event;

    public final class _lA_ extends DialogBox {

        public function _lA_(){
            var _local1 = (((((((("The Steam Overlay appears to be disabled, " + "but it is required for In-Game purchasing.\n\nPlease check to make ") + "sure the Overlay is enabled by verifying that the 'Enable Steam ") + "Community In-Game' checkbox is selected in the ") + "In-Game settings tab of the Steam Client. You can also ") + "try updating video drivers and disabling antivirus software.\n\n") + "If the issue persists, please contact Steam support at ") + '<font color="#7777EE"><a href="https://support.steampowered.com/">') + "support.steampowered.com</a></font>.");
            super(_local1, "Steam Overlay Disabled", "Ok", null);
            addEventListener(DialogBox.BUTTON1_EVENT, this.onDialogComplete);
        }
        private function onDialogComplete(_arg1:Event):void{
            if (this.parent != null)
            {
                this.parent.removeChild(this);
            }
        }

    }
}//package _rK_

