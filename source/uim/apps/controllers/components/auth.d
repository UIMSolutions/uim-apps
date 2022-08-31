module uim.apps.controllers.auth;

@safe:
import uim.apps;

class DAPPControllerRegistry : DControllerComponent
  this() {}  
}
auto APPControllerRegistry() { return new DAPPControllerRegistry; }