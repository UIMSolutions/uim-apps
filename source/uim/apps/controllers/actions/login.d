module uim.apps.controllers.actions.login;

@safe:
import uim.apps;

class DAPPActionLogin : DAPPActionController {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }

  override void initialize() {
    super.initialize; 
    this.name = "APPActionLogin";
    this.nextUrl("/login2"); 
    this.checks([APPCheckDatabase, APPCheckDatabaseLogins, APPCheckDatabaseSessions]); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPActionLogin~":DAPPActionLogin::beforeResponse(reqParameters)");
    super.beforeResponse(options);    
    if ("redirect" in options) return;

    // New Session
    if (this.request.session) this.response.terminateSession();
    string appSessionId = options.get("appSessionId", "");     
    if (appSessionId in appSessions) appSessions.remove(appSessionId);
    options.remove("appSessionId");     
        
    auto accountName = options.get("accountName", "");

    // appSession missing, create new one
    debug writeln(moduleName!DAPPActionLogin~":DAPPActionLogin::beforeResponse -> Read httpSession");
    auto httpSession = this.response.startSession();
    appSessions[httpSession.id] = APPSession(httpSession);
    options["appSessionId"] = httpSession.id;

    // Create login and session object 
    auto appSession = appSessions[httpSession.id];
    auto lastAccessedOn = toTimestamp(now());
    debug writeln(moduleName!DAPPActionLogin~":DAPPActionLogin::beforeResponse -> New login entity");
    auto colLogins = database["central"]["logins"];
    auto login = colLogins.create;
    login.lastAccessedOn = lastAccessedOn;
    login["accountName"] = accountName;    
    colLogins.insertOne(login);
    appSession.login = colLogins.findOne(login.id);
    if (!appSession.login) // debug writeln("No appSession.login for id ", login.id);

    debug writeln(moduleName!DAPPActionLogin~":DAPPActionLogin::beforeResponse -> New session entity");
    auto colSessions = database["central"]["sessions"];
    auto session = colSessions.create;
    session.lastAccessedOn = lastAccessedOn;
    session["loginId"] = login.id;    
    colSessions.insertOne(session);
    appSession.session = colSessions.findOne(session.id);
    if (!appSession.session) // debug writeln("No appSession.session for id ", session.id);

    debug writeln(moduleName!DAPPActionLogin~":DAPPActionLogin::beforeResponse -> Go to login2");
    options["redirect"] = "/login2?loginId="~appSession.login.id.toString; 
    debug writeln(appSession.debugInfo); }
}
auto APPActionLogin() { return new DAPPActionLogin; }
auto APPActionLogin(DAPPApplication myApp) { return new DAPPActionLogin(myApp); }

