module uim.apps.checks;

@safe:
import uim.apps;

public import uim.apps.checks.appsession;
public import uim.apps.checks.database;

class DAPPCheck {
  this() {}
  this(DAPPActionController action) { this(); this.action(action); }
  this(DAPPPageController page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  DAPPActionController _action;
  DAPPActionController action() { return _action; }
  O action(this O)(DAPPActionController newAction) { 
    _action = newAction; 
    return cast(O)this; }

  DAPPPageController _page;
  DAPPPageController page() { return _page; }
  O page(this O)(DAPPPageController newPage) { 
    _page = newPage; 
    return cast(O)this; }

  DETBBase _database;
  DETBBase database() { return _database; }
  O database(this O)(DETBBase newDatabase) { 
    _database = newDatabase; 
    return cast(O)this; }

  mixin(OProperty!("string", "name"));
  mixin(OProperty!("string", "redirectUrl"));

  abstract string execute(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters = null);
}

class DAPPCheckLoginPW : DAPPCheck {
  this() { super(); this.name("CheckLoginPW").redirectUrl("/login"); }
  this(DAPPActionController action) { this(); this.action(action); }
  this(DAPPPageController page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string execute(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters = null) {
    debug writeln(moduleName!DAPPCheck~":DAPPCheck::check");

    auto loginPW = reqParameters.get("loginPW", "");
    if (loginPW.empty) { // Password missing
      debug writeln(moduleName!DAPPCheckLoginPW~":DAPPCheckLoginPW::check -> No PW :(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckLoginPW~":DAPPCheckLoginPW::check -> PW has :-)");
    return null;
  }
}
auto APPCheckLoginPW() { return new DAPPCheckLoginPW; }
auto APPCheckLoginPW(DAPPActionController action) { return new DAPPCheckLoginPW(action); }
auto APPCheckLoginPW(DAPPPageController page) { return new DAPPCheckLoginPW(page); }
auto APPCheckLoginPW(DAPPCheck check) { return new DAPPCheckLoginPW(check); }

class DAPPCheckAccount : DAPPCheck {
  this() { super(); this.name("CheckAccount").redirectUrl("/account"); }
  this(DAPPActionController action) { this(); this.action(action); }
  this(DAPPPageController page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string execute(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters = null) {
    debug writeln(moduleName!DAPPCheckAccount~":DAPPCheckAccount::check");

    if (auto error = APPCheckAppSession.execute(req, res, reqParameters)) { return error; }

    auto appSession = getAppSession(reqParameters);
    if (!appSession.account) { // account missing 
      debug writeln(moduleName!DAPPCheckAccount~":DAPPCheckAccount::check -> No appSession.account :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckAccount~":DAPPCheckAccount::check -> appSession.account found :-)");
    return null;
  }
}
auto APPCheckAccount() { return new DAPPCheckAccount; }
auto APPCheckAccount(DAPPActionController action) { return new DAPPCheckAccount(action); }
auto APPCheckAccount(DAPPPageController page) { return new DAPPCheckAccount(page); }
auto APPCheckAccount(DAPPCheck check) { return new DAPPCheckAccount(check); }

class DAPPCheckAccountName : DAPPCheck {
  this() { super(); this.name("CheckAccountName").redirectUrl("/login"); }
  this(DAPPActionController action) { this(); this.action(action); }
  this(DAPPPageController page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string execute(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters = null) {
    debug writeln(moduleName!DAPPCheckAccountName~":DAPPCheckAccountName::check");

    if (auto error = APPCheckDatabaseAccounts(this).execute(req, res, reqParameters)) { return error; }

    auto appSession = getAppSession(reqParameters);
    auto accountName = appSession.login["accountName"];    
    appSession.account =  database["central", "accounts"].findOne(["name":accountName]);
    if (!appSession.account) { // Account missing
      debug writeln(moduleName!DAPPCheckAccountName~":DAPPCheckAccountName::check -> No AccountName :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckAccountName~":DAPPCheckAccountName::check -> AccountName found :-)");
    return null;
  }
}
auto APPCheckAccountName() { return new DAPPCheckAccountName; }
auto APPCheckAccountName(DAPPActionController action) { return new DAPPCheckAccountName(action); }
auto APPCheckAccountName(DAPPPageController page) { return new DAPPCheckAccountName(page); }
auto APPCheckAccountName(DAPPCheck check) { return new DAPPCheckAccountName(check); }

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
