module source.uim.apps.controllers.components.checks.appsession.appsession;

@safe:
import uim.apps;

class DAPPCheckAppSessionExists : DAPPCheck {
  mixin(AppControllerComponentThis!("APPCheckAppSessionExists"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/account")
    .checks([APPCheckAppSessionExists]);
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DAPPCheckSession~":DAPPCheckSession::check");

    auto appSession = getAppSession(reqParameters);
    if (!appSession) { // login missing 
      debug writeln(moduleName!DAPPCheckSession~":DAPPCheckSession::check -> No appSession :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckSession~":DAPPCheckSession::check -> AppSession found :-)");
    return null;
  }
}
mixin(AppControllerComponentCalls!("APPCheckAppSessionExists"));
