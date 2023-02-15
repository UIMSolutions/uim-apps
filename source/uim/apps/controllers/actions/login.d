module uim.apps.controllers.actions.login;

@safe:
import uim.apps;

class DAPPLoginActionController : DAPPSystemActionController {
  mixin(ControllerThis!("APPLoginActionController"));

  override void initialize() {
    super.initialize; 

    this
    //.nextUrl("/login2") 
    .checks([APPCheckDatabaseHasLogins, APPCheckDatabaseHasSessions]); 
  }

  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPLoginActionController~":DAPPLoginActionController("~this.name~")::beforeResponse");
    super.beforeResponse(options);    
    if (hasError || "redirect" in options) { return; }

    debug writeln("0");
    // New Session
    if (this.request.session) this.response.terminateSession();
    string appSessionId = options.get("appSessionId", "");     
    if (appSessionId in appSessions) appSessions.remove(appSessionId);
    options.remove("appSessionId");     
        
    debug writeln("1");
    // appSession missing, create new one
    debug writeln(moduleName!DAPPLoginActionController~":DAPPLoginActionController::beforeResponse -> Read httpSession");
    auto httpSession = this.response.startSession();
    appSessions[httpSession.id] = APPSession(httpSession);
    options["appSessionId"] = httpSession.id;

    debug writeln("2");
    // Create login and session object 
    this.appSession(appSessions[httpSession.id]);
    auto lastAccessedOn = toTimestamp(now());
    debug writeln(moduleName!DAPPLoginActionController~":DAPPLoginActionController("~this.name~")::beforeResponse -> New login entity");
    
    this
      .tenant(database["systems"]);

    this.logins = this.tenant["system_logins"];

    auto login = this.logins.createFromTemplate;
    login.lastAccessedOn = lastAccessedOn;
    
    debug writeln("3");
    auto accountName = options.get("accountName", "");
    login["accountName"] = accountName;    
    debug writeln("xxxx");
    this.logins.insertOne(login);
    debug writeln("xxxxx");
    this.appSession.login = this.logins.findOne(login.id);
    if (!appSession.login) {
      debug writeln("No appSession.login for id ", login.id);
      return; 
    }

    debug writeln(moduleName!DAPPLoginActionController~":DAPPLoginActionController::beforeResponse -> New session entity");
    auto session = this.sessions.createFromTemplate;
    session.lastAccessedOn = lastAccessedOn;
    session["loginId"] = login.id;    
    this.sessions.insertOne(session);
    appSession.session = this.sessions.findOne(session.id);
    if (!appSession.session) // debug writeln("No appSession.session for id ", session.id);

    debug writeln(moduleName!DAPPLoginActionController~":DAPPLoginActionController::beforeResponse -> Go to login2");
    options["redirect"] = "/login2?loginId="~appSession.login.id.toString; 
    debug writeln(appSession.debugInfo); }
}
mixin(ControllerCalls!("APPLoginActionController"));
