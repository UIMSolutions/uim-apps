module uim.apps.views.entities.create;

@safe:
import uim.apps;

class DAPPEntityCreateView : DAPPEntityView {
  mixin(APPViewThis!("APPEntityCreateView"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityCreateView~"::DAPPEntityCreateView:initialize");   
    super.initialize;

    this
      .name("APPEntityCreateView")
      .crudMode(CRUDModes.Create);
    this.pageHeader(APPPageHeader(this).actions(["refresh", "list"]));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityCreateView~"::DAPPEntityCreateView:beforeH5");    
    super.beforeH5(options);    
  }

}
mixin(APPViewCalls!("APPEntityCreateView"));

unittest {
  version(uim_apps) {
    //
  }
}