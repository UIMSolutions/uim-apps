module uim.apps.controllers.actions.login2;

@safe:
import uim.apps;

class DAPPLogin2ActionController : DAPPActionController {
  mixin(AppControllerThis!("DAPPLoginActionController"));

  override void initialize() {
    super.initialize; 
    this.name = "APPLogin2ActionController";
    this.nextUrl("/");
    this.checks([APPCheckAppSession, APPCheckLogin, APPCheckLoginPW, APPCheckAccountName, APPCheckPassword]);
  }
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPLogin2ActionController~":DAPPLogin2ActionController::beforeResponse");
    super.beforeResponse(options);    
    if ("redirect" in options) return;

    options["redirect"] = "/"; 
    debug writeln(getAppSession(options).debugInfo); }
}
mixin(AppControllerCalls!("APPLogin2ActionController"));