module uim.apps.controller.components.checks;

@safe:
import uim.apps;

public import uim.apps.controller.components.checks.check;

public import uim.apps.controller.components.checks.appsession;
public import uim.apps.controller.components.checks.database;









class DAPPCheckPassword : DAPPCheck {
  this() { super(); this.name("CheckPassword").redirectUrl("/login"); }
  this(DAPPActionController action) { this(); this.action(action); }
  this(DAPPPageController page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string execute(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters = null) {
    debug writeln(moduleName!DAPPCheckPassword~":DAPPCheckPassword::check -> Looking for password");

    if (auto error = APPCheckAccount.execute(req, res, reqParameters)) { return error; }

    auto appSession = appSessions.get(reqParameters.get("appSessionId", ""), null);
    auto loginPW = reqParameters.get("loginPW", "");

    auto password = database["central", "passwords"].findOne(["accountId": appSession.account.id.toString]);
    if (!password) { // Password missing
      // debug writeln("No PW for account -> redirect to /login");
      return redirectUrl; }

    // Check Password
    debug writeln(moduleName!DAPPCheckPassword~":DAPPCheckPassword::check -> Check PW");
    debug writeln(password.display, " vs. ", toHexString(sha512Of(loginPW)));
    if (password.display != toHexString(sha512Of(loginPW))) { // Password is wrong
      debug writeln(moduleName!DAPPCheckPassword~":DAPPCheckPassword::check -> Wrong password -> redirect to /login");
      return redirectUrl; }

    return null; 
  }
}
auto APPCheckPassword() { return new DAPPCheckPassword; }
auto APPCheckPassword(DAPPActionController action) { return new DAPPCheckPassword(action); }
auto APPCheckPassword(DAPPPageController page) { return new DAPPCheckPassword(page); }
auto APPCheckPassword(DAPPCheck check) { return new DAPPCheckPassword(check); }

class DAPPCheckSiteId : DAPPCheck {
  this() { super(); this.name("CheckSiteId").redirectUrl("/"); }
  this(DAPPActionController action) { this(); this.action(action); }
  this(DAPPPageController page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string execute(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters = null) {
    debug writeln(moduleName!DAPPCheckSiteId~":DAPPCheckSiteId::check -> Looking for siteId");

    if (auto error = APPCheckAppSession(this).execute(req, res, reqParameters)) { return error; }
    auto appSession = getAppSession(reqParameters);

    if (auto error = APPCheckDatabaseCentral(this).execute(req, res, reqParameters)) { return error; }
    if (auto error = APPCheckDatabaseSites(this).execute(req, res, reqParameters)) { return error; }

    auto siteId = reqParameters.get("siteId", "");
    if (!siteId.isUUID) { 
      debug writeln(moduleName!DAPPCheckSiteId~":DAPPCheckSiteId::request - site id invalid:", siteId);
      reqParameters["redirect"] = "/"; 
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckSiteId~":DAPPCheckSiteId::request - site id valid:", siteId);

    debug writeln(moduleName!DAPPCheckSiteId~":DAPPCheckSiteId::request - Has site?");
    appSession.site = database["central", "sites"].findOne(UUID(siteId));
    setAppSession(appSession, reqParameters);
    if (!appSession.site) {
      debug writeln(moduleName!DAPPCheckSiteId~":DAPPCheckSiteId::request - Missing site for ", siteId);
      reqParameters["redirect"] = "/"; 
      return redirectUrl; }

    debug writeln(moduleName!DAPPCheckSiteId~":DAPPCheckSiteId::request - site found ", siteId);
    return null; 
  }
}
auto APPCheckSiteId() { return new DAPPCheckSiteId; }
auto APPCheckSiteId(DAPPActionController action) { return new DAPPCheckSiteId(action); }
auto APPCheckSiteId(DAPPPageController page) { return new DAPPCheckSiteId(page); }
auto APPCheckSiteId(DAPPCheck check) { return new DAPPCheckSiteId(check); }
