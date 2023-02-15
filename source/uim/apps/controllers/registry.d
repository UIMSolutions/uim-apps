module uim.apps.controllers.registry;

@safe:
import uim.apps;

class DControllerRegistry : DRegistry!DController {
    this() {}  
}
auto ControllerRegistry() { return new DControllerRegistry; }