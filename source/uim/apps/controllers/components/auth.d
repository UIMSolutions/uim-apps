module uim.apps.controllers.auth;

@safe:
import uim.apps;

class DAuthControllerComponent : DControllerComponent
  this() {}  
}
auto AuthControllerComponent() { return new DAuthControllerComponent; }

version(test_uim_apps) { unitest {
  assert(AuthControllerComponent);
}}