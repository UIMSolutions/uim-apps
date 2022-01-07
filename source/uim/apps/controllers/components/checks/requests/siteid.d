module uim.apps.controllers.components.checks.requests.siteid;

@safe:
import uim.apps;

class DAPPCheckRequestHasSiteId : DAPPCheckDatabaseHasAccounts {
  mixin(AppControllerComponentThis!("APPCheckRequestHasSiteId"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login")
    .addChecks([APPCheckRequestExists]);
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckRequestHasSiteId~":DAPPCheckRequestHasSiteId::execute");
    if (!super.execute(options)) { return false; }

    if ("siteId" !in options) { // siteId  missing
      this.
        error("No SiteId in Request");
      return false; 
    }

    debug writeln("SiteId = ", options["siteId"]);
    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckRequestHasSiteId"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPCheckRequestHasSiteId);
    assert(APPCheckRequestHasSiteId);
    assert(new DAPPCheckRequestHasSiteId(APPController));
    assert(APPCheckRequestHasSiteId(APPController));
  }
}