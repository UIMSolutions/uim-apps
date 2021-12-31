module uim.apps.sessions.nullsession;

@safe:
import uim.apps;

class DAPPNullSession : DAPPSession{
  this() { super(); }

  this(Session httpSession) {
    super(httpSession); }

  this(Session httpSession, DAPPPageController page) {
    super(httpSession, page); }

  override bool isValid(string[] factors, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPSession~":DAPPNullSession::beforeResponse -> No appSession => redirect /login");
    reqParameters["redirect"] = "/login";
    return false;
  }
  override string debugInfo() { return "Null appSession"; }
}
auto APPNullSession() { return new DAPPNullSession(); }
auto APPNullSession(Session httpSession) { return new DAPPNullSession(httpSession); }
auto APPNullSession(Session httpSession, DAPPPageController page) { return new DAPPNullSession(httpSession, page); }

