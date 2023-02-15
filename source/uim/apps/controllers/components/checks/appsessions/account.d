module uim.apps.controllers.components.checks.appsessions.account;

@safe:
import uim.apps;

class DControllerCheckAppSessionHasAccount : DControllerCheckAppSessionExists {
  mixin(ControllerComponentThis!("APPCheckAppSessionHasAccount"));

  override void initialize() {
    super.initialize;

    this
      .redirectUrl("/error?account_missing");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DControllerCheckAppSessionHasAccount~":DControllerCheckAppSessionHasAccount::check");
    if (!super.execute(options)) { return false; } 

    auto appSession = getAppSession(options);
    if (!appSession.account) { // account missing 
      this.error("Account Missing");
      return false;
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckAppSessionHasAccount"));
