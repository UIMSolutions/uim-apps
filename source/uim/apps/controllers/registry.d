module uim.apps.controllers.registry;

@safe:
import uim.apps;

class DAPPControllerRegistry : DRegistry!DAPPController {
    this() {}  
}
auto APPControllerRegistry() { return new DAPPControllerRegistry; }