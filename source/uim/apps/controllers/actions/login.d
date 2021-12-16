module uim.apps.controllers.actions.login;

@safe:
import uim.apps;

class DAPPActionLogin : DAPPAction {
  this() { super(); 
    this
    .nextUrl("/login2") 
    .checks([APPCheckDatabase, APPCheckDatabaseLogins, APPCheckDatabaseSessions]); }
  this(DAPPUIM myApp) { this().app(myApp); }
  this(DAPPUIM myApp, string myName) { this(myApp).name(myName); }
  this(DAPPUIM myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPUIM myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }

  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPActionLogin~":DAPPActionLogin::beforeResponse(reqParameters)");
    super.beforeResponse(options);    
    if ("redirect" in options) return;

    // New Session
    if (_request.session) _response.terminateSession();
    string appSessionId = options.get("appSessionId", "");     
    if (appSessionId in appSessions) appSessions.remove(appSessionId);
    options.remove("appSessionId");     
        
    auto accountName = options.get("accountName", "");

    // appSession missing, create new one
    debug writeln(moduleName!DAPPActionLogin~":DAPPActionLogin::beforeResponse -> Read httpSession");
    auto httpSession = _response.startSession();
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
auto APPActionLogin(DAPPUIM myApp) { return new DAPPActionLogin(myApp); }
auto APPActionLogin(DAPPUIM myApp, string myName) { return new DAPPActionLogin(myApp, myName); }
auto APPActionLogin(DAPPUIM myApp, DETBBase myDatabase) { return new DAPPActionLogin(myApp, myDatabase); }
auto APPActionLogin(DAPPUIM myApp, string myName, DETBBase myDatabase) { return new DAPPActionLogin(myApp, myName, myDatabase); }
