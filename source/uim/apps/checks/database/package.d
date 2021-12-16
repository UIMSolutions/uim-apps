module uim.apps.checks.database;

@safe:
import uim.apps;

class DAPPCheckDatabase : DAPPCheck {
  this() { super(); this.name("CheckDatabase").redirectUrl("/error?message=database_missing"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckDatabase~":DAPPCheckDatabase::check");

    if (!database) { // database missing 
      debug writeln(moduleName!DAPPCheckDatabase~":DAPPCheckDatabase::check -> No database found :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckDatabase~":DAPPCheckDatabase::check -> Database found :-)");
    return null;
  }
}
auto APPCheckDatabase() { return new DAPPCheckDatabase; }
auto APPCheckDatabase(DAPPAction action) { return new DAPPCheckDatabase(action); }
auto APPCheckDatabase(DAPPPage page) { return new DAPPCheckDatabase(page); }
auto APPCheckDatabase(DAPPCheck check) { return new DAPPCheckDatabase(check); }

class DAPPCheckDatabaseCentral : DAPPCheckDatabase {
  this() { super(); this.name("CheckDatabaseCentral").redirectUrl("/error?message=missing_dbcentral"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckDatabaseCentral~":DAPPCheckDatabaseCentral::check");
    if (auto error = super.check(req, res, reqParameters)) { return error; }

    if (!database.hasTenant("central")) { // collection logins missing 
      debug writeln(moduleName!DAPPCheckDatabaseCentral~":DAPPCheckDatabaseCentral::check -> Tenant Central missing :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckDatabaseCentral~":DAPPCheckDatabaseCentral::check -> Tenant Central found :-)");
    return null;
  }
}
auto APPCheckDatabaseCentral() { return new DAPPCheckDatabaseLogins; }
auto APPCheckDatabaseCentral(DAPPAction action) { return new DAPPCheckDatabaseCentral(action); }
auto APPCheckDatabaseCentral(DAPPPage page) { return new DAPPCheckDatabaseCentral(page); }
auto APPCheckDatabaseCentral(DAPPCheck check) { return new DAPPCheckDatabaseCentral(check); }

class DAPPCheckDatabaseLogins : DAPPCheckDatabaseCentral {
  this() { super(); this.name("CheckDatabaseLogins").redirectUrl("/error?message=logins_missing"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckDatabaseLogins~":DAPPCheckDatabaseLogins::check");
    if (auto error = super.check(req, res, reqParameters)) { return error; }

    if (!database.hasCollection("central", "logins")) { // collection logins missing 
      debug writeln(moduleName!DAPPCheckDatabaseLogins~":DAPPCheckDatabaseLogins::check -> Logins collection missing :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckDatabaseLogins~":DAPPCheckDatabaseLogins::check -> Logins collection found :-)");
    return null;
  }
}
auto APPCheckDatabaseLogins() { return new DAPPCheckDatabaseLogins; }
auto APPCheckDatabaseLogins(DAPPAction action) { return new DAPPCheckDatabaseLogins(action); }
auto APPCheckDatabaseLogins(DAPPPage page) { return new DAPPCheckDatabaseLogins(page); }
auto APPCheckDatabaseLogins(DAPPCheck check) { return new DAPPCheckDatabaseLogins(check); }

class DAPPCheckDatabaseSessions : DAPPCheckDatabaseCentral {
  this() { super(); this.name("DatabaseSessions").redirectUrl("/error?message=sessions_missing"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckDatabaseSessions~":DAPPCheckDatabaseSessions::check");
    if (auto error = super.check(req, res, reqParameters)) { return error; }

    if (!database.hasCollection("central", "sessions")) { // collection missing 
      debug writeln(moduleName!DAPPCheckDatabaseSessions~":DAPPCheckDatabaseSessions::check -> Collection sessions in database missing :-(");     
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckDatabaseSessions~":DAPPCheckDatabaseSessions::check -> Collection sessions in database found :-)");     
    return null;
  }
}
auto APPCheckDatabaseSessions() { return new DAPPCheckDatabaseSessions; }
auto APPCheckDatabaseSessions(DAPPAction action) { return new DAPPCheckDatabaseSessions(action); }
auto APPCheckDatabaseSessions(DAPPPage page) { return new DAPPCheckDatabaseSessions(page); }
auto APPCheckDatabaseSessions(DAPPCheck check) { return new DAPPCheckDatabaseSessions(check); }

class DAPPCheckDatabaseSites : DAPPCheckDatabaseCentral {
  this() { super(); this.name("DatabaseSites").redirectUrl("/error?message=sites_missing"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckDatabaseSites~":DAPPCheckDatabaseSites::check");
    if (auto error = super.check(req, res, reqParameters)) { return error; }

    if (!database.hasCollection("central", "sites")) { // collection missing 
      debug writeln(moduleName!DAPPCheckDatabaseSites~":DAPPCheckDatabaseSites::check -> collection sites missing :-( ");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckDatabaseSites~":DAPPCheckDatabaseSites::check -> collection sites found :-)");
    return null;
  }
}
auto APPCheckDatabaseSites() { return new DAPPCheckDatabaseSites; }
auto APPCheckDatabaseSites(DAPPAction action) { return new DAPPCheckDatabaseSites(action); }
auto APPCheckDatabaseSites(DAPPPage page) { return new DAPPCheckDatabaseSites(page); }
auto APPCheckDatabaseSites(DAPPCheck check) { return new DAPPCheckDatabaseSites(check); }

class DAPPCheckDatabaseTenants : DAPPCheckDatabaseCentral {
  this() { super(); this.name("DatabaseTenants").redirectUrl("/error?message=tenants_missing"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckDatabaseTenants~":DAPPCheckDatabaseTenants::check");
    if (auto error = super.check(req, res, reqParameters)) { return error; }

    if (!database.hasCollection("central", "tenants")) { // collection missing 
      debug writeln(moduleName!DAPPCheckDatabaseTenants~":DAPPCheckDatabaseTenants::check -> collection tenants (sites) missing :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckDatabaseTenants~":DAPPCheckDatabaseTenants::check -> collection tenants(sites) found :-)");
    return null;
  }
}
auto APPCheckDatabaseTenants() { return new DAPPCheckDatabaseTenants; }
auto APPCheckDatabaseTenants(DAPPAction action) { return new DAPPCheckDatabaseTenants(action); }
auto APPCheckDatabaseTenants(DAPPPage page) { return new DAPPCheckDatabaseTenants(page); }
auto APPCheckDatabaseTenants(DAPPCheck check) { return new DAPPCheckDatabaseTenants(check); }

class DAPPCheckDatabaseAccounts : DAPPCheckDatabaseCentral {
  this() { super(); this.name("DatabaseAccounts").redirectUrl("/error?message=Accounts_missing"); }
  this(DAPPAction action) { this(); this.action(action); }
  this(DAPPPage page) { this(); this.page(page); }
  this(DAPPCheck check) { this(); this.database(check.database); }

  override string check(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCheckDatabaseAccounts~":DAPPCheckDatabaseAccounts::check");
    if (auto error = super.check(req, res, reqParameters)) { return error; }

    if (!database.hasCollection("central", "accounts")) { // collection missing 
      debug writeln(moduleName!DAPPCheckDatabaseAccounts~":DAPPCheckDatabaseAccounts::check -> collection Accounts  missing :-(");
      return redirectUrl; }
    debug writeln(moduleName!DAPPCheckDatabaseAccounts~":DAPPCheckDatabaseAccounts::check -> collection Accounts found :-)");
    return null;
  }
}
auto APPCheckDatabaseAccounts() { return new DAPPCheckDatabaseAccounts; }
auto APPCheckDatabaseAccounts(DAPPAction action) { return new DAPPCheckDatabaseAccounts(action); }
auto APPCheckDatabaseAccounts(DAPPPage page) { return new DAPPCheckDatabaseAccounts(page); }
auto APPCheckDatabaseAccounts(DAPPCheck check) { return new DAPPCheckDatabaseAccounts(check); }
