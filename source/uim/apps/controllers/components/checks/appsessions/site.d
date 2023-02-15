module uim.apps.controllers.components.checks.appsessions.site;

@safe:
import uim.apps;

class DControllerCheckAppSessionHasSite : DControllerCheckAppSessionExists {
  mixin(ControllerComponentThis!("APPCheckAppSessionHasSite"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckAppSessionHasSite~":DControllerCheckAppSessionHasSite::check");
    if (!super.execute(options)) { return false; }

    auto site = getAppSession(options).site;
    if (!site) { 
      this.error("appsession_site_missing");
      return false; 
    }

    debug writeln(moduleName!DControllerCheckAppSessionHasSite~":DControllerCheckAppSessionHasSite::check -> appSession.site found -> ", site.id);
    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckAppSessionHasSite"));
