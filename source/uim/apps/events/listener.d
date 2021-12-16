module uim.apps.events.listener;

@safe:
import uim.apps;
/**
 * Objects implementing this interface should declare the `implementedEvents()` method
 * to notify the event manager what methods should be called when an event is triggered.
 */
interface IAPPEventListener
{
    /**
     * Returns a list of events this object is implementing. When the class is registered
     * in an event manager, each individual method will be associated with the respective event.
     */
    string[] implementedEvents();
}