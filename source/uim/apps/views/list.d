module uim.apps.views.list;

@safe:
import uim.apps;

class DAPPListView : DAPPEntitiesView {
  mixin(APPViewThis!("APPListView"));

  mixin(OProperty!("string", "rootPath"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPListView~"::DAPPListView:beforeH5"); 
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }
  }
}
mixin(APPViewCalls!("APPListView"));