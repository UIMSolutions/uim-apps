module uim.apps.views.list;

@safe:
import uim.apps;

class DAPPListView : DAPPView {
  mixin(APPViewThis!("APPListView"));

  mixin(OProperty!("string", "rootPath"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPListView~"::DAPPListView:beforeH5"); 
    super.beforeH5(options);
  }
}
mixin(APPViewCalls!("APPListView"));