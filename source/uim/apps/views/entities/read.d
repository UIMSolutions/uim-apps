module uim.apps.views.entities.read;

@safe:
import uim.apps;

class DAPPEntityReadView : DAPPEntityView {
  mixin(APPViewThis!("APPEntityReadView"));

  override void initialize() {
    super.initialize;

    this
      .crudMode(CRUDModes.Read)
      .pageHeader(
        APPPageHeader(this)
          .actions(["refresh", "create"]));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityView~"::DAPPEntityView:beforeH5");    
    super.beforeH5(options);   
  }

}
mixin(APPViewCalls!("APPEntityReadView"));

unittest {
  version(test_uim_apps) {
    //
  }
}