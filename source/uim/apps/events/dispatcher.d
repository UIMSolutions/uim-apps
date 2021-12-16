module uim.apps.events.dispatcher;

@safe:
import uim.apps;

/**
 * Objects implementing this interface can emit events.
 *
 * Objects with this interface can trigger events, and have
 * an event manager retrieved from them.
 *
 * The {@link \Cake\Event\EventDispatcherTrait} lets you easily implement
 * this interface.
 */
interface IAPPEventDispatcher {
    /**
     * Wrapper for creating and dispatching events.
     *
     * Returns a dispatched event.
     *
     * @param string name Name of the event.
     * @param array|null data Any value you wish to be transported with this event to
     * it can be read by listeners.
     * @param object|null subject The object that this event applies to
     * (this by default).
     * @return \Cake\Event\EventInterface
     */
    // IAPPEvent dispatchEvent(string name, STRINGAA data = null, object subject = null);

    /**
     * Sets the Cake\Event\EventManager manager instance for this object.
     *
     * You can use this instance to register any new listeners or callbacks to the
     * object events, or create your own events and trigger them at will.
     * @param \Cake\Event\IEventManager eventManager the eventManager to set
     */
    O eventManager(this O)(IAPPEventManager eventManager);

    // Returns the Cake\Event\EventManager manager instance for this object.
    IAPPEventManager eventManager();
}