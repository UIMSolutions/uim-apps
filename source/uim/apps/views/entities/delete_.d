module uim.apps.views.entities.delete_;

@safe:
import uim.apps;

class DAPPEntityDeleteView : DAPPEntityView {
  mixin(APPViewThis!("APPEntityDeleteView"));

  override void initialize() {
    super.initialize;

    this
      .name("APPEntityDeleteView")
      .crudMode(CRUDModes.Delete);
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityDeleteView~"::DAPPEntityDeleteView:beforeH5");    
    super.beforeH5(options);    
  }
}
mixin(APPViewCalls!("APPEntityDeleteView"));

unittest {
  version(test_uim_apps) {
    //
  }
}