module uim.apps.controllers.actions.action;

@safe:
import uim.apps;

class DAPPAction : DAPPController {
  this() { super(); }
  this(DAPPUIM myApp) { this().app(myApp); }
  this(DAPPUIM myApp, string myName) { this(myApp).name(myName); }
  this(DAPPUIM myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPUIM myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }


  mixin(OProperty!("string", "nextUrl"));

  protected DAPPCheck[] _checks;
  DAPPCheck[] checks() { return _checks; }
  void checks(DAPPCheck[] someChecks) {
    foreach (check; someChecks) {
      _checks ~= check.action(this);
    }
  }
  void clearChecks() { _checks = null; }

  override void beforeResponse(STRINGAA options = null) {
    super.beforeResponse(options);

    debug writeln(moduleName!DAPPAction~":DAPPAction::check -> Before checks --------------");
    if (auto appSession = getAppSession(options)) appSession.debugInfo; 
    else {
      // debug writeln("!!!! No appSession"); 
    }
    foreach (actionCheck; checks) {
      // debug writeln("----------------------------------------------------------------------");
      debug writeln(moduleName!DAPPAction~":DAPPAction::check -> "~actionCheck.name);
      actionCheck.database(database);
      if (auto redirectUrl = actionCheck.check(_request, _response, options)) {
        options["redirect"] = redirectUrl;
        break; }} 
    if (auto appSession = getAppSession(options)) appSession.debugInfo; 
    else {
      // debug writeln("!!!! No appSession");
    }
    debug writeln(moduleName!DAPPAction~":DAPPAction::check -> After checks --------------");

    if (checks) {
      if ("redirect" in options) {
        debug writeln(moduleName!DAPPAction~":DAPPAction::check -> Redirect to ", options["redirect"]); }
      else {
        debug writeln(moduleName!DAPPAction~":DAPPAction::check -> All checks successful, no redirect"); }
    }
    else {
      writeln(moduleName!DAPPAction~":DAPPAction::check -> No checks, no worry ;-)");
    }
    debug writeln(moduleName!DAPPAction~":DAPPAction::check -> Final ---------------");
    if (auto appSession = getAppSession(options)) appSession.debugInfo; 
    else {
      // debug writeln("!!!! No appSession");
    }
  }
}
