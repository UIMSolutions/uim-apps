module uim.apps.applications.registry;

@safe:
import uim.apps;

class DAPPApplicationRegistry : DRegistry!DAPPApplication {
    this() {}  
}
auto APPApplicationRegistry() { return new DAPPApplicationRegistry; }


