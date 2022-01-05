module uim.apps.controller.components.checks.requests.password;

@safe:
import uim.apps;

class DAPPCheckAccountNameInSession : DAPPCheck {
  mixin(AppControllerComponentThis!("APPCheckAccountNameInSession"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login")
    .checks([APPCheckDatabaseAccounts]);
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckAccountNameInSession~":DAPPCheckAccountNameInSession::execute");
    if (!super.execute(options)) { return false; }

    auto appSession = getAppSession(reqParameters);
    auto accountName = appSession.login["accountName"];    
    appSession.account =  database["central", "accounts"].findOne(["name":accountName]);
    if (!appSession.account) { // Account missing
      this.
      eror("No AccountName");
      return false; 
    }

    debug writeln(moduleName!DAPPCheckAccountNameInSession~":DAPPCheckAccountNameInSession::execute -> AccountName found :-)");
    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckAccountNameInSession"));
