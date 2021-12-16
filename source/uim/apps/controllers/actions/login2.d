module uim.apps.controllers.actions.login2;

@safe:
import uim.apps;

class DAPPActionLogin2 : DAPPAction {
  this() { super();
    this
      .nextUrl("/") 
      .checks([
        APPCheckAppSession, 
        APPCheckLogin, 
        APPCheckLoginPW, 
        APPCheckAccountName, 
        APPCheckPassword]); }
  this(DAPPUIM myApp) { this().app(myApp); }
  this(DAPPUIM myApp, string myName) { this(myApp).name(myName); }
  this(DAPPUIM myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPUIM myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }

  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPActionLogin~":DAPPActionLogin::beforeResponse(reqParameters)");
    super.beforeResponse(options);    
    if ("redirect" in options) return;

    options["redirect"] = "/"; 
    debug writeln(getAppSession(options).debugInfo); }
}
auto APPActionLogin2() { return new DAPPActionLogin2; }