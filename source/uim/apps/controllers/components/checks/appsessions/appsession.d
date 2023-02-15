module uim.apps.controllers.components.checks.appsessions.appsession;

@safe:
import uim.apps;

class DControllerCheckAppSessionExists : DControllerCheck {
  mixin(ControllerComponentThis!("APPCheckAppSessionExists"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/account");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DControllerCheckAppSessionExists~":DControllerCheckAppSessionExists::check");

    auto appSession = getAppSession(options);
    if (!appSession) { // appsession missing 
      this.error("appsession_missing");
      return false; 
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckAppSessionExists"));
