module uim.apps.views.logout;

@safe:
import uim.apps;

class DAPPViewLogout : DAPPView {
  this() { super(); }
  this(DH5AppController aController) { this().controller(aController); }
  this(string aName) { this().name(aName); }
  this(DH5AppController aController, string aName) { this(aController).name(aName); }
}
auto APPViewLogout() { return new DAPPViewLogout(); }
auto APPViewLogout(DH5AppController aController) { return new DAPPViewLogout(aController); }
auto APPViewLogout(string aName) { return new DAPPViewLogout(aName); }
auto APPViewLogout(DH5AppController aController, string aName) { return new DAPPViewLogout(aController, aName); }