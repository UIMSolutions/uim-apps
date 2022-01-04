module uim.apps.controllers.actions.setsite;

@safe:
import uim.apps;

class DAPPSelectSiteActionController : DAPPActionController {
  mixin(AppControllerThis!("APPSelectSiteActionController"));

  override void initialize() {
    super.initialize; 
    this.name = "APPSelectSiteActionController";
    this.checks([APPCheckAppSession, APPCheckSession, APPCheckDatabaseSessions, APPCheckDatabaseSites, APPCheckSiteId]); 
  }
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request");
    super.beforeResponse(options);
    if ("redirect" in options) return;
        
    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Working with AppSession");
    auto appSession = getAppSession(options);
    
    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Working with AppSession.session");
    auto session = appSession.session; 
    auto site = appSession.site;
    if (session && site) {
      session.lastAccessedOn = toTimestamp(now());
      session["lastAccessISO"] = now.toISOString;
      session["siteId"] = site.id.toString;
      session.save;
      appSession.session = session; 
    
      debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Working with AppSession.site");
      site.lastAccessedOn = session.lastAccessedOn;
      site["lastAccessISO"] = session["lastAccessISO"];
      site.save; 
      appSession.site = site; 
      setAppSession(appSession, options); }

      debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Redirect to /");
    options["redirect"] = "/";
	}
}
mixin(AppControllerCalls!("APPSelectSiteActionController"));