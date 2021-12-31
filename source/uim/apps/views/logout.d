module uim.apps.views.logout;

@safe:
import uim.apps;

class DAPPViewLogout : DAPPView {
  mixin(APPViewThis!("APPViewLogout"));
  this(string aName) { this().name(aName); }
  this(DAPPPageController aController, string aName) { this(aController).name(aName); }
}
auto APPViewLogout() { return new DAPPViewLogout(); }
auto APPViewLogout(DAPPPageController aController) { return new DAPPViewLogout(aController); }
auto APPViewLogout(string aName) { return new DAPPViewLogout(aName); }
auto APPViewLogout(DAPPPageController aController, string aName) { return new DAPPViewLogout(aController, aName); }