module uim.apps.controllers.actions.login2;

@safe:
import uim.apps;

class DAPPActionLogin2 : DAPPActionController {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }

  override void initialize() {
    super.initialize; 
    this.name = "APPActionLogin2";
    this.nextUrl("/");
    this.checks([APPCheckAppSession, APPCheckLogin, APPCheckLoginPW, APPCheckAccountName, APPCheckPassword]);
  }
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPActionLogin2~":DAPPActionLogin2::beforeResponse");
    super.beforeResponse(options);    
    if ("redirect" in options) return;

    options["redirect"] = "/"; 
    debug writeln(getAppSession(options).debugInfo); }
}
auto APPActionLogin2() { return new DAPPActionLogin2; }
auto APPActionLogin2(DAPPApplication myApp) { return new DAPPActionLogin2(myApp); }