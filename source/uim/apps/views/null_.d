module uim.apps.views.null_;

@safe:
import uim.apps;

class DAPPNullView : DView {
  mixin(ViewThis!("APPNullView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    return null;
  }

  override string render(STRINGAA options = null) {
    return null;
  }
}
mixin(ViewCalls!("APPNullView"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(APPNullView.name == "APPNullView");
    assert(APPNullView.name("newView").name == "newView");
}}
