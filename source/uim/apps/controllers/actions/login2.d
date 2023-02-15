module uim.apps.controllers.actions.login2;

@safe:
import uim.apps;

class DAPPLogin2ActionController : DAPPSystemActionController {
  mixin(ControllerThis!("DAPPLogin2ActionController"));

  override void initialize() {
    super.initialize; 

    this
      .checks([
        APPCheckAppSessionHasLogin, // AppSession checks
        APPCheckRequestHasPassword, // Request checks
        APPCheckDatabaseHasPasswords
      ]);
  }
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPLogin2ActionController~":DAPPLogin2ActionController("~this.name~")::beforeResponse");
    super.beforeResponse(options);    
    if (hasError || "redirect" in options) { return; }

    debug writeln("X3");
    auto account = this.accounts.findOne(["name":appSession.login["accountName"]]);
    if (!account) { this.error("database_account_missing"); return; }
    appSession.account = account;

    debug writeln("X4");
    auto password = this.passwords.findOne(["accountId": account.id.toString]);
    if (!password) { this.error("database_password_missing"); return; }

    options["redirect"] = "/"; 
    debug writeln(getAppSession(options).debugInfo); }
}
mixin(ControllerCalls!("APPLogin2ActionController"));