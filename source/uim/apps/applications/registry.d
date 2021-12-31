module uim.apps.applications.registry;

@safe:
import uim.apps;

class DAPPApplicationRegistry : DOOPRegistry!DAPPApplication {
    this() {}  
}
auto APPApplicationRegistry() { return new DAPPApplicationRegistry; }


