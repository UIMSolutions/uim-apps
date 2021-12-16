module uim.apps.events.event;

@safe:
import uim.apps;

class DAPPEvent : IAPPEvent {
  this() { this.name("Event"); }
  this(string eventName) { this(); this.name(eventName); }


  // Name of event
  mixin(OProperty!("string", "name"));

  // Propagation is on when mode = true
  mixin(OProperty!("bool", "propagationMode"));

  // Stops the event from being used anymore.
  void stopPropagation() { this.propagationMode(false); }

  // Checks if the event is stopped. Returns true if the event is stopped
  bool isStopped() { return !propagationMode; }

  // The result value of the event listeners.
  Json result() { return Json(null); }

  // Listeners can attach a result value to the event.
  IAPPEvent result(Json value = Json(null)) {
    return null;
  }

  // #region data
    // Accesses the event data/payload. If the key does not exist a null value is returned.
    STRINGAA data(string key) { return null; }
    // Accesses the event data/payload. If the keys do not exist a null value is returned. If keys = null all data will be returned
    STRINGAA data(string[] keys = null) {return null; }

    // Assigns a value to the data/payload of this event.
    IAPPEvent data(string key, string value) { return null; }
    // Assigns values to the data/payload of this event.
    IAPPEvent data(STRINGAA values) { return null; }
  // #endregion data
}