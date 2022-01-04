module uim.apps.controllers.actions.action;

@safe:
import uim.apps;

class DAPPActionController : DAPPController {
  mixin(AppControllerThis!("APPActionController"));

  override void initialize() {
    super.initialize; 
  }

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

    debug writeln(moduleName!DAPPActionController~":DAPPAction::check -> Before checks --------------");
    if (auto appSession = getAppSession(options)) appSession.debugInfo; 
    else {
      // debug writeln("!!!! No appSession"); 
    }
    foreach (actionCheck; checks) {
      // debug writeln("----------------------------------------------------------------------");
      debug writeln(moduleName!DAPPActionController~":DAPPAction::check -> "~actionCheck.name);
      actionCheck.database(database);
      if (auto redirectUrl = actionCheck.execute(this.request, this.response, options)) {
        options["redirect"] = redirectUrl;
        break; }} 
    if (auto appSession = getAppSession(options)) appSession.debugInfo; 
    else {
      // debug writeln("!!!! No appSession");
    }
    debug writeln(moduleName!DAPPActionController~":DAPPAction::check -> After checks --------------");

    if (checks) {
      if ("redirect" in options) {
        debug writeln(moduleName!DAPPActionController~":DAPPAction::check -> Redirect to ", options["redirect"]); }
      else {
        debug writeln(moduleName!DAPPActionController~":DAPPAction::check -> All checks successful, no redirect"); }
    }
    else {
      writeln(moduleName!DAPPActionController~":DAPPAction::check -> No checks, no worry ;-)");
    }
    debug writeln(moduleName!DAPPActionController~":DAPPAction::check -> Final ---------------");
    if (auto appSession = getAppSession(options)) appSession.debugInfo; 
    else {
      // debug writeln("!!!! No appSession");
    }
  }
}
mixin(AppControllerCalls!("APPActionController"));
