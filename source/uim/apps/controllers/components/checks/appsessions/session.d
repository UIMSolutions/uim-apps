module uim.apps.controllers.components.checks.appsessions.session;

@safe:
import uim.apps;

class DAPPCheckAppSessionHasSession : DAPPCheckAppSessionExists {
  mixin(AppControllerComponentThis!("APPCheckAppSessionHasSession"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckAppSessionHasSession~":DAPPCheckAppSessionHasSession::check");
    if (!super.execute(options)) { return false; }

    auto session = getAppSession(options).session;
    if (!session) { // session missing 
      this.error("appsession_session_missing");
      return false; 
    }

    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckAppSessionHasSession"));
