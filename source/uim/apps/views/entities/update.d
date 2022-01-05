module uim.apps.views.entities.update;

@safe:
import uim.apps;

class DAPPEntityUpdateView : DAPPEntityView {
  mixin(APPViewThis!("APPEntityUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .name("APPEntityUpdateView")
      .crudMode(CRUDModes.Update);
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityUpdateView~"::DAPPEntityUpdateView:beforeH5");    
    super.beforeH5(options);    
  }
}
mixin(APPViewCalls!("APPEntityUpdateView"));

unittest {
  version(test_uim_apps) {
    //
  }
}