module uim.apps.checks;

@safe:
import uim.apps;

public import uim.apps.checks.appsession;
public import uim.apps.checks.database;

class DAPPCheck {
  this() {}
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  DAPPAction _action;
  DAPPAction action() { return _action; }
  O action(this O)(DAPPAction newAction) { 
    _action = newAction; 
    return cast(O)this; }

  DAPPPage _page;
  DAPPPage page() { return _page; }
  O page(this O)(DAPPPage newPage) { 
    _page = newPage; 
    return cast(O)this; }

  DETBBase _database;
  DETBBase database() { return _database; }
  O database(this O)(DETBBase newDatabase) { 
    _database = newDatabase; 
    return cast(O)this; }

  mixin(OProperty!("string", "name"));
  mixin(OProperty!("string", "redirectUrl"));

  abstract string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters);
}

class DAPPCheckLoginPW : DAPPCheck {
  this() { super(); this.name("CheckLoginPW").redirectUrl("/login"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
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
auto APPCheckLoginPW(DAPPAction action) { return new DAPPCheckLoginPW(action); }
auto APPCheckLoginPW(DAPPPage page) { return new DAPPCheckLoginPW(page); }
auto APPCheckLoginPW(DAPPCheck check) { return new DAPPCheckLoginPW(check); }

class DAPPCheckAccount : DAPPCheck {
  this() { super(); this.name("CheckAccount").redirectUrl("/account"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckAccount~":DAPPCheckAccount::check");

    if (auto error = APPCheckAppSession.check(req, res, reqParameters)) { return error; }

    auto appSession = getAppSession(reqParameters);
    if (!appSession.account) { // account missing 
      debug writeln(moduleName!DAPPCheckAccount~":DAPPCheckAccount::check -> No appSession.account :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckAccount~":DAPPCheckAccount::check -> appSession.account found :-)");
    return null;
  }
}
auto APPCheckAccount() { return new DAPPCheckAccount; }
auto APPCheckAccount(DAPPAction action) { return new DAPPCheckAccount(action); }
auto APPCheckAccount(DAPPPage page) { return new DAPPCheckAccount(page); }
auto APPCheckAccount(DAPPCheck check) { return new DAPPCheckAccount(check); }

class DAPPCheckAccountName : DAPPCheck {
  this() { super(); this.name("CheckAccountName").redirectUrl("/login"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckAccountName~":DAPPCheckAccountName::check");

    if (auto error = APPCheckDatabaseAccounts(this).check(req, res, reqParameters)) { return error; }

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
auto APPCheckAccountName(DAPPAction action) { return new DAPPCheckAccountName(action); }
auto APPCheckAccountName(DAPPPage page) { return new DAPPCheckAccountName(page); }
auto APPCheckAccountName(DAPPCheck check) { return new DAPPCheckAccountName(check); }

class DAPPCheckPassword : DAPPCheck {
  this() { super(); this.name("CheckPassword").redirectUrl("/login"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckPassword~":DAPPCheckPassword::check -> Looking for password");

    if (auto error = APPCheckAccount.check(req, res, reqParameters)) { return error; }

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
auto APPCheckPassword(DAPPAction action) { return new DAPPCheckPassword(action); }
auto APPCheckPassword(DAPPPage page) { return new DAPPCheckPassword(page); }
auto APPCheckPassword(DAPPCheck check) { return new DAPPCheckPassword(check); }

class DAPPCheckSiteId : DAPPCheck {
  this() { super(); this.name("CheckSiteId").redirectUrl("/"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckSiteId~":DAPPCheckSiteId::check -> Looking for siteId");

    if (auto error = APPCheckAppSession(this).check(req, res, reqParameters)) { return error; }
    auto appSession = getAppSession(reqParameters);

    if (auto error = APPCheckDatabaseCentral(this).check(req, res, reqParameters)) { return error; }
    if (auto error = APPCheckDatabaseSites(this).check(req, res, reqParameters)) { return error; }

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
auto APPCheckSiteId(DAPPAction action) { return new DAPPCheckSiteId(action); }
auto APPCheckSiteId(DAPPPage page) { return new DAPPCheckSiteId(page); }
auto APPCheckSiteId(DAPPCheck check) { return new DAPPCheckSiteId(check); }
