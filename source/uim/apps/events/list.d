module uim.apps.events.list;

@safe:
import uim.apps;

/**
 * The Event List
 */
class EventList // implements ArrayAccess, Countable
{
    // Events list
    protected IAPPEvent[] _events;

    // Empties the list of dispatched events.
    void flush() {
        _events = []; }
    unittest {
      version(uim_apps) {
        // TODO Add Tests
        }}

    // Adds an event to the list when event listing is enabled.
    void add(IAPPEvent anEvent) {
        _events ~= anEvent; }
    unittest {
      version(uim_apps) {
        // TODO Add Tests
        }}

    // Whether a offset exists
    bool offsetExists(string anOffset) {
        return false; }
    unittest {
      version(uim_apps) {
        // TODO Add Tests
        }}

    // Offset to retrieve
    IAPPEvent offsetGet(string offset) {
      if (offsetExists(offset)) {
          return null;
      }

      return null; }
    unittest {
      version(uim_apps) {
        // TODO Add Tests
        }}

    // Offset to set
    void offsetSet(string anOffset, string aValue) {
        // TODO
    }

    // Offset to unset
    void offsetUnset(string anOffset) {
        // TODO
    }

    // Count elements of an object
    size_t count() {  
      return _events.length; }

    // Checks if an event is in the list.
    bool hasEvent(string aName) {
      foreach (ev; _events) {
        if (ev.name == aName) return true;
      }

      return false;
    }
}
