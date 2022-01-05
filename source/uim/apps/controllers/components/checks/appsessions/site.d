module source.uim.apps.controllers.components.checks.appsessions.site;

@safe:
import uim.apps;

class DAPPCheckAppSessionHasSite : DAPPCheckAppSession {
  mixin(AppControllerComponentThis!("APPCheckAppSessionHasSite"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login")
    .checks([APPCheckAppSessionExists]);
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckAppSessionHasSite~":DAPPCheckAppSessionHasSite::check");
    if (!super.execute(options)) { return false; }

    auto site = getAppSession(options).site;
    if (!site) { // session missing 
      debug writeln(moduleName!DAPPCheckAppSessionHasSite~":DAPPCheckAppSessionHasSite::execute -> No site found");
      return false; 
    }

    debug writeln(moduleName!DAPPCheckAppSessionHasSite~":DAPPCheckAppSessionHasSite::check -> appSession.site found -> ", site.id);
    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckAppSessionHasSite"));
