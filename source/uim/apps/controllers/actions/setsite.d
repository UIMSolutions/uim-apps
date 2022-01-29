module uim.apps.controllers.actions.setsite;

@safe:
import uim.apps;

class DAPPSelectSiteActionController : DAPPActionController {
  mixin(APPControllerThis!("APPSelectSiteActionController"));

  override void initialize() {
    super.initialize; 
    
    this.name = "APPSelectSiteActionController";
    this.checks([
      APPCheckAppSessionHasSession, // AppSession Checks
      APPCheckDatabaseHasSessions, APPCheckDatabaseHasSites, // Database checks 
      APPCheckRequestHasSiteId // Request Checks
    ]); 
  }
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request");
    super.beforeResponse(options);
    if ("redirect" in options) return;
        
    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Working with AppSession");
    auto appSession = getAppSession(options);
    
    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Working with AppSession.session");
    auto session = appSession.session; 
    debug writeln(session ? "Found session" : "Missing session");

    auto site = database["systems"]["system_sites"].findOne(["id":options.get("siteId", null)]);
    debug writeln(site ? "Found site" : "Missing site");

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
      setAppSession(appSession, options); 
    }

    debug writeln(moduleName!DAPPSelectSiteActionController~":DAPPSelectSiteActionController::request - Redirect to /");
    options["redirect"] = "/";
    debug writeln(appSession.debugInfo);
	}
}
mixin(APPControllerCalls!("APPSelectSiteActionController"));