module uim.apps.controller.components.checks.appsessions.session;

@safe:
import uim.apps;

class DAPPCheckAppSessionHasSession : DAPPCheckAppSession {
  mixin(AppControllerComponentThis!("APPCheckAppSessionHasSession"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login")
    .checks([APPCheckAppSessionExists]);
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckAppSessionHasSession~":DAPPCheckAppSessionHasSession::check");
    if (!super.execute(options)) { return false; }

    auto session = getAppSession(options).session;
    if (!session) { // session missing 
      debug writeln(moduleName!DAPPCheckAppSessionHasSession~":DAPPCheckAppSessionHasSession::execute -> No session found");
      return false; 
    }

    debug writeln(moduleName!DAPPCheckAppSessionHasSession~":DAPPCheckAppSessionHasSession::check -> appSession.session found -> ", session.id);
    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckAppSessionHasSession"));
