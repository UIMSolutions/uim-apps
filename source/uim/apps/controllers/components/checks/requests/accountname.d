module uim.apps.controllers.components.checks.requests.accountname;

@safe:
import uim.apps;

class DAPPCheckRequestHasAccountName : DAPPCheckDatabaseHasAccounts {
  mixin(AppControllerComponentThis!("APPCheckRequestHasAccountName"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!APPCheckRequestHasAccountName~":APPCheckRequestHasAccountName::execute");
    if (!super.execute(options)) { return false; }

    if ("accountName" !in options) { // Account  missing
      this.error("request_accountname_missing");
      return false; 
    }

    debug writeln("accountName = ", options["accountName"]);
    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckRequestHasAccountName"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPCheckRequestHasAccountName);
    assert(APPCheckRequestHasAccountName);
    assert(new DAPPCheckRequestHasAccountName(APPController));
    assert(APPCheckRequestHasAccountName(APPController));
  }
}
