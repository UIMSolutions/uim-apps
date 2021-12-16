module uim.apps.views.registry;

@safe:
import uim.apps;

class DAPPViewRegistry : DOOPRegistry!DAPPView {
  this() { super(); }
}
auto APPViewRegistry() { return new DAPPViewRegistry(); }
