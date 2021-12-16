module uim.apps.events.registry;

@safe:
import uim.apps;

class DAPPEventRegistry : DOOPRegistry!DAPPEvent {
}
auto APPEventRegistry() { return new DAPPEventRegistry; }