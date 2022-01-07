module uim.apps.views.list;

@safe:
import uim.apps;

class DAPPListView : DAPPView, IAPPWithEntities {
  mixin(APPViewThis!("APPListView"));

  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPListView~"::DAPPListView:beforeH5"); 
    super.beforeH5(options);
  }
}
mixin(APPViewCalls!("APPListView"));