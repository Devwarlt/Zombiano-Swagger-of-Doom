/**
 * Created by Fabian on 30.01.2015.
 */
package WebRequestEvents {
import flash.events.Event;

public class WebRequestRetryEvent extends Event {
    public static const RETRY:String = "ON_RETRY";

    public var attempt:int;

    public function WebRequestRetryEvent(attempt:int) {
        super(RETRY);
        this.attempt = attempt;
    }
}
}
