module uim.apps.controllers.registry;

@safe:
import uim.apps;

class DAPPControllerRegistry : DOOPRegistry!DAPPController {
    this() {}  
}
auto APPControllerRegistry() { return new DAPPControllerRegistry; }