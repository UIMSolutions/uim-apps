module uim.apps.controllers.components.checks.appsessions.appsession;

@safe:
import uim.apps;

class DAPPCheckAppSessionExists : DAPPCheck {
  mixin(APPControllerComponentThis!("APPCheckAppSessionExists"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/account");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DAPPCheckAppSessionExists~":DAPPCheckAppSessionExists::check");

    auto appSession = getAppSession(options);
    if (!appSession) { // appsession missing 
      this.error("appsession_missing");
      return false; 
    }

    return true;
  }
}
mixin(APPControllerComponentCalls!("APPCheckAppSessionExists"));
