module uim.apps.controllers.components.checks.requests.password;

@safe:
import uim.apps;

class DAPPCheckRequestHasPassword : DAPPCheck {
  mixin(AppControllerComponentThis!("APPCheckRequestHasPassword"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckRequestHasPassword~":DAPPCheckRequestHasPassword::execute");
    super.execute(options);

    if ("loginPW" !in options) { // loginPW  missing
      this.
        error("No loginPW in Request");
      return false; 
    }

    debug writeln("loginPW = ", options["loginPW"]);
    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckRequestHasPassword"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPCheckRequestHasPassword);
    assert(APPCheckRequestHasPassword);
    assert(new DAPPCheckRequestHasPassword(APPController));
    assert(APPCheckRequestHasPassword(APPController));
  }
}
