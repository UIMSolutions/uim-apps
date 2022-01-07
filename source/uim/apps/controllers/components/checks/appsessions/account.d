module uim.apps.controllers.components.checks.appsessions.account;

@safe:
import uim.apps;

class DAPPCheckAppSessionHasAccount : DAPPCheckAppSessionExists {
  mixin(AppControllerComponentThis!("APPCheckAppSessionHasAccount"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?account_missing");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DAPPCheckAppSessionHasAccount~":DAPPCheckAppSessionHasAccount::check");
    if (!super.execute(options)) { return false; } 

    auto appSession = getAppSession(options);
    if (!appSession.account) { // account missing 
      this.error("Account Missing");
      return false;
    }

    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckAppSessionHasAccount"));
