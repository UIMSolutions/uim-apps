module uim.apps.controllers.components.checks.requests.password;

@safe:
import uim.apps;

class DAPPCheckRequestHasPassword : DAPPCheck {
  mixin(APPControllerComponentThis!("APPCheckRequestHasPassword"));

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
mixin(APPControllerComponentCalls!("APPCheckRequestHasPassword"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DAPPCheckRequestHasPassword);
    assert(APPCheckRequestHasPassword);
    assert(new DAPPCheckRequestHasPassword(APPController));
    assert(APPCheckRequestHasPassword(APPController));
  }
}
