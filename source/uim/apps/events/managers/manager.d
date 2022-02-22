module uim.apps.events.managers.manager;

@safe:
import uim.apps;

/**
 * The event manager is responsible for keeping track of event listeners, passing the correct
 * data to them, and firing them in the correct order, when associated events are triggered. You
 * can create multiple instances of this object to manage local events or keep a single instance
 * and pass it around to manage all events in your app.
 */
class DAPPEventManager : IAPPEventManager {
    // The default priority queue value for new, attached listeners
    static int defaultPriority = 10;

    // The globally available instance, used for dispatching events attached from any scope
    protected static DAPPEventManager _generalManager;

    // List of listener callbacks associated to
    protected IAPPEventListener[] _listeners;

    // Internal flag to distinguish a common manager from the singleton
    protected bool _isGlobal;

    // The event list object.
    protected IAPPEventListener _eventList;

    // Enables automatic adding of events to the event list object if it is present.
    protected bool _trackEvents;

    /**
     * Returns the globally available instance of a Cake\Event\EventManager
     * this is used for dispatching events attached from outside the scope
     * other managers were created. Usually for creating hook systems or inter-class
     * communication
     *
     * If called with the first parameter, it will be set as the globally available instance
     *
     * @param \Cake\Event\EventManager|null manager Event manager instance.
     * @return \Cake\Event\EventManager The global event manager
     */
/*     public static function instance(?EventManager manager = null)
    {
        if (manager instanceof EventManager) {
            static::_generalManager = manager;
        }
        if (empty(static::_generalManager)) {
            static::_generalManager = new static();
        }

        static::_generalManager._isGlobal = true;

        return static::_generalManager;
    } */

    /**
     * @inheritDoc
     */
     void on(string eventKey, /* callable */ Json options = Json(null)) { // TODO 
     }
/*     public function on(eventKey, options = [], ?callable callable = null)
    {
        if (eventKey instanceof EventListenerInterface) {
            _attachSubscriber(eventKey);

            return this;
        }

        argCount = func_num_args();
        if (argCount === 2) {
            _listeners[eventKey][static::defaultPriority][] = [
                "callable" => options,
            ];

            return this;
        }

        priority = options["priority"] ?? static::defaultPriority;
        _listeners[eventKey][priority][] = [
            "callable" => callable,
        ];

        return this;
    } */

    // Auxiliary function to attach all implemented callbacks of a Cake\Event\EventListenerInterface class instance
    // as individual methods on this manager
    protected void _attachSubscriber(IAPPEventListener subscriber) {
/*         foreach (subscriber.implementedEvents() as eventKey => function) {
            options = [];
            method = function;
            if (is_array(function) && isset(function["callable"])) {
                [method, options] = _extractCallable(function, subscriber);
            } elseif (is_array(function) && is_numeric(key(function))) {
                foreach (function as f) {
                    [method, options] = _extractCallable(f, subscriber);
                    on(eventKey, options, method);
                }
                continue;
            }
            if (is_string(method)) {
                method = [subscriber, function];
            }
            on(eventKey, options, method);
        }
 */    }

    /**
     * Auxiliary function to extract and return a PHP callback type out of the callable definition
     * from the return value of the `implementedEvents()` method on a {@link \Cake\Event\EventListenerInterface}
     *
     * @param array function the array taken from a handler definition for an event
     * @param \Cake\Event\EventListenerInterface object The handler object
     * @return array
     */
//    auto _extractCallable(array function, EventListenerInterface object) {
        /** @var callable method */
/*         method = function["callable"];
        options = function;
        unset(options["callable"]);
        if (is_string(method)) {
            /** @var callable method */
           /*  method = [object, method];
        } */

       /*  return [method, options];
    } */

    //
    void off(this O)(string eventKey, Json options = Json(null)) {
/*         if (eventKey instanceof EventListenerInterface) {
            _detachSubscriber(eventKey);

            return this;
        }

        if (!is_string(eventKey)) {
            if (!is_callable(eventKey)) {
                throw new CakeException(
                    "First argument of EventManager::off() must be " .
                    " string or EventListenerInterface instance or callable."
                );
            }

            foreach (array_keys(_listeners) as name) {
                off(name, eventKey);
            }

            return this;
        }

        if (callable instanceof EventListenerInterface) {
            _detachSubscriber(callable, eventKey);

            return this;
        }

        if (callable === null) {
            unset(_listeners[eventKey]);

            return this;
        }

        if (empty(_listeners[eventKey])) {
            return this;
        }

        foreach (_listeners[eventKey] as priority => callables) {
            foreach (callables as k => callback) {
                if (callback["callable"] === callable) {
                    unset(_listeners[eventKey][priority][k]);
                    break;
                }
            }
        }
 */
    }

    /**
     * Auxiliary function to help detach all listeners provided by an object implementing EventListenerInterface
     *
     * @param \Cake\Event\EventListenerInterface subscriber the subscriber to be detached
     * @param string|null eventKey optional event key name to unsubscribe the listener from
     * @return void
     */
    protected void _detachSubscriber(IAPPEventListener subscriber, string eventKey = null) {
/*         events = subscriber.implementedEvents();
        if (!empty(eventKey) && empty(events[eventKey])) {
            return;
        }
        if (!empty(eventKey)) {
            events = [eventKey => events[eventKey]];
        }
        foreach (events as key => function) {
            if (is_array(function)) {
                if (is_numeric(key(function))) {
                    foreach (function as handler) {
                        handler = handler["callable"] ?? handler;
                        off(key, [subscriber, handler]);
                    }
                    continue;
                }
                function = function["callable"];
            }
            off(key, [subscriber, function]);
        }
 */    }

    //
    IAPPEvent dispatch(string eventName) {
      auto event = new DAPPEvent(eventName);

      auto listeners = listeners(event.name);
      if (_trackEvents) { /* addEventToList(event); */ }

/*       if (_isGlobal && static::instance().isTrackingEvents()) {
          static::instance().addEventToList(event);
      }
 */
      if (listeners.empty) return event;

      foreach (listener; listeners) {
        if (event.isStopped()) break;

/*         auto result = _callListener(listener["callable"], event);
        if (result == false) event.stopPropagation();
        if (result !is null) event.result(result);
 */      }

      return event;
    }

    // Calls a listener.
/*      *
     * @param callable listener The listener to trigger.
     * @param \Cake\Event\IAPPEvent event Event instance.
     * @return mixed The result of the listener function.
 */     
    IAPPEventListener _callListener(IAPPEventListener listener, IAPPEvent event) {
      auto data = event.data();

      return null; // listener(event/* , ...array_values(data) */);
    }

    //
    IAPPEventListener[] listeners(string eventKey) {
      auto localListeners = [];
      if (!_isGlobal) {
        localListeners = prioritisedListeners(eventKey);
        localListeners = empty(localListeners) ? [] : localListeners;
      }
      IAPPEventListener[] globalListeners; // TODO = static::instance().prioritisedListeners(eventKey);
      globalListeners = globalListeners.empty ? [] : globalListeners;

/*       priorities = array_keys(globalListeners)~array_keys(localListeners);
      priorities = array_unique(priorities);
      asort(priorities);
 */
      IAPPEventListener[] result = null;
/*       foreach (priorities as priority) {
        if (isset(globalListeners[priority])) {
            result = array_merge(result, globalListeners[priority]);
        }
        if (isset(localListeners[priority])) {
            result = array_merge(result, localListeners[priority]);
        }
      }

 */      return result;
    }

    // Returns the listeners for the specified event key indexed by priority
    IAPPEventListener[] prioritisedListeners(string eventKey) {
      // if (eventKey !in _listeners || _listeners[eventKey].empty) return [];

      return null; } // _listeners[eventKey]; }

    // Returns the listeners matching a specified pattern
    IAPPEventListener[] matchingListeners(string eventKeyPattern) {
      IAPPEventListener[] matches;

      // TODO
/*       matchPattern = "/" . preg_quote(eventKeyPattern, "/") . "/";
      matches = array_intersect_key(
          _listeners,
          array_flip(
              preg_grep(matchPattern, array_keys(_listeners), 0)
          )
      );
 */
      return matches; }

    // Returns the event list.
    auto getEventList() {
      return _eventList; }

    // Adds an event to the list if the event list object is present.
    O addEventToList(this O)(IAPPEvent event) {
      if (_eventList) _eventList.add(event);
      return cast(O)this; }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO Add tests
        }}

    // Enables / disables event tracking at runtime.
    O trackEvents(this O)(bool enabled) {
      _trackEvents = enabled;

      return cast(O)this; }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO Add tests
        }}

    // Returns whether this manager is set up to track events
    bool isTrackingEvents() {
      return _trackEvents && _eventList; }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO Add tests
        }}

    // Enables the listing of dispatched events.
    // eventList The event list object to use.
    O setEventList(this O)(DAPPEventList eventList) {
      _eventList = eventList;
      _trackEvents = true;

      return cast(O)this; }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO Add tests
        }}

    // Disables the listing of dispatched events.
    O unsetEventList(this O)() {
      _eventList = null;
      _trackEvents = false;

      return cast(O)this; }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
        // TODO Add tests
        }}

    // Debug friendly object properties.
    public STRINGAA __debugInfo() {
      STRINGAA properties;
/*         properties = get_object_vars(this);
        properties["_generalManager"] = "(object) EventManager";
        properties["_listeners"] = [];
        foreach (_listeners as key => priorities) {
            listenerCount = 0;
            foreach (priorities as listeners) {
                listenerCount += count(listeners);
            }
            properties["_listeners"][key] = listenerCount . " listener(s)";
        }
        if (_eventList) {
            count = count(_eventList);
            for (i = 0; i < count; i++) {
                event = _eventList[i];
                try {
                    subject = event.getSubject();
                    properties["_dispatchedEvents"][] = event.getName() . " with subject " . get_class(subject);
                } catch (CakeException e) {
                    properties["_dispatchedEvents"][] = event.getName() . " with no subject";
                }
            }
        } else {
            properties["_dispatchedEvents"] = null;
        }
        unset(properties["_eventList"]);
 */
        return properties;
    }
}