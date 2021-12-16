module uim.apps.checks.appsession;

@safe:
import uim.apps;

class DAPPCheckAppSession : DAPPCheck {
  this() { super(); this.name("CheckAppSession").redirectUrl("/login"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckSession~":DAPPCheckSession::check");

    auto appSession = getAppSession(reqParameters);
    if (!appSession) { // login missing 
      debug writeln(moduleName!DAPPCheckSession~":DAPPCheckSession::check -> No appSession :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckSession~":DAPPCheckSession::check -> AppSession found :-)");
    return null;
  }
}
auto APPCheckAppSession() { return new DAPPCheckAppSession; }
auto APPCheckAppSession(DAPPAction action) { return new DAPPCheckAppSession(action); }
auto APPCheckAppSession(DAPPPage page) { return new DAPPCheckAppSession(page); }
auto APPCheckAppSession(DAPPCheck check) { return new DAPPCheckAppSession(check); }

class DAPPCheckSession : DAPPCheckAppSession {
  this() { super(); this.name("CheckSession").redirectUrl("/login"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckSession~":DAPPCheckSession::check");
    if (auto error = super.check(req, res, reqParameters)) { return error; }

    auto appSession = appSessions.get(reqParameters.get("appSessionId", ""), null);
    if (!appSession.session) { // login missing 
      debug writeln(moduleName!DAPPCheckSession~":DAPPCheckSession::check -> No appSession.session :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckSession~":DAPPCheckSession::check -> appSession.session found :-)");
    return null;
  }
}
auto APPCheckSession() { return new DAPPCheckSession; }
auto APPCheckSession(DAPPAction action) { return new DAPPCheckSession(action); }
auto APPCheckSession(DAPPPage page) { return new DAPPCheckSession(page); }
auto APPCheckSession(DAPPCheck check) { return new DAPPCheckSession(check); }

class DAPPCheckSite : DAPPCheckAppSession {
  this() { super(); this.name("CheckSite").redirectUrl("/"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckSite~":DAPPCheckSite::check");
    if (auto error = super.check(req, res, reqParameters)) { return error; }

    auto appSession = getAppSession(reqParameters);
    if (!appSession.site) { // login missing 
      debug writeln(moduleName!DAPPCheckSite~":DAPPCheckSite::check -> No appSession.site :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckSite~":DAPPCheckSite::check -> appSession.site found :-)");
    return null;
  }
}
auto APPCheckSite() { return new DAPPCheckSite; }
auto APPCheckSite(DAPPAction action) { return new DAPPCheckSite(action); }
auto APPCheckSite(DAPPPage page) { return new DAPPCheckSite(page); }
auto APPCheckSite(DAPPCheck check) { return new DAPPCheckSite(check); }

class DAPPCheckLogin : DAPPCheckAppSession {
  this() { super(); this.name("CheckLogin").redirectUrl("/login"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }
  
  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckLogin~":DAPPCheckLogin::check");
    if (auto error = super.check(req, res, reqParameters)) { return error; }

    auto appSession = getAppSession(reqParameters);
    if (!appSession.login) { // login missing 
      debug writeln(moduleName!DAPPCheckLogin~":DAPPCheckLogin::check -> No appSession,login :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckLogin~":DAPPCheckLogin::check -> appSession.login found :-)");
    return null;
  }
}
auto APPCheckLogin() { return new DAPPCheckLogin; }
auto APPCheckLogin(DAPPAction action) { return new DAPPCheckLogin(action); }
auto APPCheckLogin(DAPPPage page) { return new DAPPCheckLogin(page); }
auto APPCheckLogin(DAPPCheck check) { return new DAPPCheckLogin(check); }
