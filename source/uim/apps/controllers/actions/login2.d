module uim.apps.controllers.actions.login2;

@safe:
import uim.apps;

class DAPPLogin2ActionController : DAPPActionController {
  mixin(APPControllerThis!("DAPPLoginActionController"));

  override void initialize() {
    super.initialize; 
    this.name = "APPLogin2ActionController";
    this
      .checks([
        APPCheckAppSessionHasLogin, // AppSession checks
        APPCheckRequestHasPassword, // Request checks
        APPCheckDatabaseHasPasswords
      ]);
  }
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPLogin2ActionController~":DAPPLogin2ActionController::beforeResponse");
    super.beforeResponse(options);    
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);

    auto tenant = database["systems"];

    auto account = tenant["system_accounts"].findOne(["name":appSession.login["accountName"]]);
    if (!account) {
      this.error("database_account_missing");
      return;
    }
    appSession.account = account;

    auto password = tenant["system_passwords"].findOne(["accountId": account.id.toString]);
    if (!account) {
      this.error("database_password_missing");
      return;
    }

    options["redirect"] = "/"; 
    debug writeln(getAppSession(options).debugInfo); }
}
mixin(APPControllerCalls!("APPLogin2ActionController"));