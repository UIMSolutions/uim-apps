module uim.apps.controllers.actions.setsite;

@safe:
import uim.apps;

class DAPPActionSetSite : DAPPActionController {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }

  override void initialize() {
    super.initialize; 
    this.name = "APPActionSetSite";
    this.checks([APPCheckAppSession, APPCheckSession, APPCheckDatabaseSessions, APPCheckDatabaseSites, APPCheckSiteId]); 
  }
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPActionSetSite~":DAPPActionSetSite::request");
    super.beforeResponse(options);
    if ("redirect" in options) return;
        
    debug writeln(moduleName!DAPPActionSetSite~":DAPPActionSetSite::request - Working with AppSession");
    auto appSession = getAppSession(options);
    
    debug writeln(moduleName!DAPPActionSetSite~":DAPPActionSetSite::request - Working with AppSession.session");
    auto session = appSession.session; 
    auto site = appSession.site;
    if (session && site) {
      session.lastAccessedOn = toTimestamp(now());
      session["lastAccessISO"] = now.toISOString;
      session["siteId"] = site.id.toString;
      session.save;
      appSession.session = session; 
    
      debug writeln(moduleName!DAPPActionSetSite~":DAPPActionSetSite::request - Working with AppSession.site");
      site.lastAccessedOn = session.lastAccessedOn;
      site["lastAccessISO"] = session["lastAccessISO"];
      site.save; 
      appSession.site = site; 
      setAppSession(appSession, options); }

      debug writeln(moduleName!DAPPActionSetSite~":DAPPActionSetSite::request - Redirect to /");
    options["redirect"] = "/";
	}
}
auto APPActionSetSite() { return new DAPPActionSetSite; }
auto APPActionSetSite(DAPPApplication myApp) { return new DAPPActionSetSite(myApp); }