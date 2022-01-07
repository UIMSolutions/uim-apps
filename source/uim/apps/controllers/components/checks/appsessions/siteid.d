module uim.apps.controllers.components.checks.appsessions.siteid;

@safe:
import uim.apps;

class DAPPCheckAppSessionHasSiteId : DAPPCheckAppSessionHasSession {
  mixin(AppControllerComponentThis!("APPCheckAppSessionHasSiteId"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckAppSessionHasSiteId~":DAPPCheckAppSessionHasSiteId::check");
    if (!super.execute(options)) { return false; }

    auto session = getAppSession(options).session;
    if (!session["siteId"]) { // site id in session missing 
      this.error("appsession_siteid_missing");
      return false; 
    }

    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckAppSessionHasSiteId"));
