module uim.apps.controllers.components.checks.appsessions.login;

@safe:
import uim.apps;

class DAPPCheckAppSessionHasLogin : DAPPCheckAppSessionExists {
  mixin(APPControllerComponentThis!("APPCheckAppSessionHasLogin"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckAppSessionHasLogin~":DAPPCheckAppSessionHasLogin::check");
    if (!super.execute(options)) { return false; }

    auto login = getAppSession(options).login;
    if (!login) { // login missing 
      this.error("appsession_login_missing");
      return false; 
    }

    debug writeln(moduleName!DAPPCheckAppSessionHasLogin~":DAPPCheckAppSessionHasLogin::check -> appSession.login found -> ", login.id);
    return true;
  }
}
mixin(APPControllerComponentCalls!("APPCheckAppSessionHasLogin"));
