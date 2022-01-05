module uim.apps.controller.components.checks.requests.account;

@safe:
import uim.apps;

class DAPPCheckAccount : DAPPCheck {
  mixin(AppControllerComponentThis!("APPCheckAccount"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/account")
    .checks([APPCheckAppSession]);
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DAPPCheckAccount~":DAPPCheckAccount::check");
    if (!super.execute(options)) { return false; } 

    auto appSession = getAppSession(reqParameters);
    if (!appSession.account) { // account missing 
      this.error("Account Missing");
      return false;
    }
    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckAccount"));
