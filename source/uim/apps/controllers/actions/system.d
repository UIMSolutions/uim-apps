module uim.apps.controllers.actions.system;

@safe:
import uim.apps;

class DAPPSystemActionController : DAPPActionController {
  mixin(APPControllerThis!("APPSystemActionController"));

  mixin(OProperty!("DETBCollection", "logins"));
  mixin(OProperty!("DETBCollection", "sessions"));
  mixin(OProperty!("DETBCollection", "accounts"));
  mixin(OProperty!("DETBCollection", "sites"));
  mixin(OProperty!("DETBCollection", "passwords"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPSystemActionController~":DAPPSystemActionController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    this.tenant(ETBNullTenant).collection(ETBNullCollection); // Clear
    debug writeln("-0-");

    if (this.database) {
      debug writeln("Found database"); 

      this.tenant(database["systems"]);
      this.logins(this.tenant["system_logins"]);
      this.sessions(this.tenant["system_sessions"]);
      this.accounts(this.tenant["system_accounts"]);
      this.sites(this.tenant["system_sites"]);
      this.passwords(this.tenant["system_passwords"]);
    }  
  }
}
mixin(APPControllerCalls!("APPSystemActionController"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DAPPSystemActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPSystemActionController);
}}
