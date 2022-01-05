module source.uim.apps.controllers.components.checks.appsessions.login;

@safe:
import uim.apps;

class DAPPCheckAppSessionHasLogin : DAPPCheckAppSession {
  mixin(AppControllerComponentThis!("APPCheckAppSessionHasLogin"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login")
    .checks([APPCheckAppSessionExists]);
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckAppSessionHasLogin~":DAPPCheckAppSessionHasLogin::check");
    if (!super.execute(options)) { return false; }

    auto login = getAppSession(options).login;
    if (!login) { // session missing 
      debug writeln(moduleName!DAPPCheckAppSessionHasLogin~":DAPPCheckAppSessionHasLogin::execute -> No login found");
      return false; 
    }

    debug writeln(moduleName!DAPPCheckAppSessionHasLogin~":DAPPCheckAppSessionHasLogin::check -> appSession.login found -> ", login.id);
    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckAppSessionHasLogin"));
