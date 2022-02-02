module uim.apps.controllers.actions.login;

@safe:
import uim.apps;

class DAPPLoginActionController : DAPPActionController {
  mixin(APPControllerThis!("APPLoginActionController"));

  override void initialize() {
    super.initialize; 

    this.name = "APPLoginActionController";
    this
    //.nextUrl("/login2") 
    .checks([APPCheckDatabaseHasLogins, APPCheckDatabaseHasSessions]); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPLoginActionController~":DAPPLoginActionController::beforeResponse");
    super.beforeResponse(options);    
    if (hasError || "redirect" in options) { return; }

    // New Session
    if (this.request.session) this.response.terminateSession();
    string appSessionId = options.get("appSessionId", "");     
    if (appSessionId in appSessions) appSessions.remove(appSessionId);
    options.remove("appSessionId");     
        
    // appSession missing, create new one
    debug writeln(moduleName!DAPPLoginActionController~":DAPPLoginActionController::beforeResponse -> Read httpSession");
    auto httpSession = this.response.startSession();
    appSessions[httpSession.id] = APPSession(httpSession);
    options["appSessionId"] = httpSession.id;

    // Create login and session object 
    auto appSession = appSessions[httpSession.id];
    auto lastAccessedOn = toTimestamp(now());
    debug writeln(moduleName!DAPPLoginActionController~":DAPPLoginActionController::beforeResponse -> New login entity");
    
    auto tenant = database["systems"];
    auto colLogins = tenant["system_logins"];

    auto login = colLogins.createFromTemplate;
    login.lastAccessedOn = lastAccessedOn;
    
    auto accountName = options.get("accountName", "");
    login["accountName"] = accountName;    
    debug writeln("xxxx");
    colLogins.insertOne(login);
    debug writeln("xxxxx");
    appSession.login = colLogins.findOne(login.id);
    if (!appSession.login) {
      debug writeln("No appSession.login for id ", login.id);
      return; 
    }

    debug writeln(moduleName!DAPPLoginActionController~":DAPPLoginActionController::beforeResponse -> New session entity");
    auto colSessions = tenant["system_sessions"];
    auto session = colSessions.createFromTemplate;
    session.lastAccessedOn = lastAccessedOn;
    session["loginId"] = login.id;    
    colSessions.insertOne(session);
    appSession.session = colSessions.findOne(session.id);
    if (!appSession.session) // debug writeln("No appSession.session for id ", session.id);

    debug writeln(moduleName!DAPPLoginActionController~":DAPPLoginActionController::beforeResponse -> Go to login2");
    options["redirect"] = "/login2?loginId="~appSession.login.id.toString; 
    debug writeln(appSession.debugInfo); }
}
mixin(APPControllerCalls!("APPLoginActionController"));
