module uim.apps.controllers.actions.action;

@safe:
import uim.apps;

class DAPPActionController : DAPPController {
  mixin(APPControllerThis!("APPActionController"));

  mixin(OProperty!("DAPPSession", "appSession"));
  mixin(OProperty!("DETBCollection", "collection"));
  mixin(OProperty!("DOOPEntity", "site"));
  mixin(OProperty!("DETBTenant", "tenant"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPActionController~":DAPPActionController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    this.appSession = getAppSession(options);
    if (appSession) { this.site(appSession.site); }
    
    this.tenant(ETBNullTenant).collection(ETBNullCollection); // Clear
      debug writeln("this.database"); 
    if (this.database) {
      debug writeln("Found database -this.database"); 

      debug writeln("this.site");
      if (this.site) {
        this.tenant(database[site]);
      }

      debug writeln("this.tenant");
      if (this.tenant) {
        this.collection(this.tenant[this.collectionName]);
      }
    }  
  }
}
mixin(APPControllerCalls!("APPActionController"));

version(test_uim_apps) { unittest {
  writeln("--- Test in ", __MODULE__, "/", __LINE__);
  testController(new DAPPActionController);

  assert(APPActionController.collectionName("testName").collectionName == "testName");
  assert(APPActionController.rootPath("testPath").rootPath == "testPath");
  testController();
}}
