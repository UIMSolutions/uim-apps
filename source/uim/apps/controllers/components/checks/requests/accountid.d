module uim.apps.controllers.components.checks.requests.accountid;

@safe:
import uim.apps;

class DAPPCheckRequestHasAccountId : DAPPCheckDatabaseHasAccounts {
  mixin(AppControllerComponentThis!("APPCheckAccountIdInSession"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!APPCheckRequestHasAccountId~":APPCheckRequestHasAccountId::execute");
    if (!super.execute(options)) { return false; }

    if ("accountId" !in options) { // Account  missing
      this.error("request_accountid_missing");
      return false; 
    }

    debug writeln("accountId = ", options["accountId"]);
    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckRequestHasAccountId"));
