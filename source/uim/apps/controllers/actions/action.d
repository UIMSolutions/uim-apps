module uim.apps.controllers.actions.action;

@safe:
import uim.apps;

class DAPPActionController : DAPPController {
  mixin(APPControllerThis!("APPActionController"));

  mixin(OProperty!("DAPPSession", "appSession"));
  mixin(OProperty!("DETBCollection", "collection"));
  mixin(OProperty!("string", "collectionName"));
  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("DOOPEntity", "site"));
  mixin(OProperty!("DETBTenant", "tenant"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPActionController~":DAPPActionController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    this.appSession = getAppSession(options);
    if (appSession) { this.site(appSession.site); }
    
    this.tenant(ETBNullTenant).collection(ETBNullCollection); // Clear
    if (this.database) {
      debug writeln("Found database"); 

      this.tenant(database[site.name]);
      if (this.tenant) {
        this.collection(this.tenant[this.collectionName]);
      }
    }  
  }
}
mixin(APPControllerCalls!("APPActionController"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DAPPActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPActionController);
}}