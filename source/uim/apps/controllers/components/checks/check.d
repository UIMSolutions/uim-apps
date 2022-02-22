module uim.apps.controllers.components.checks.check;

@safe:
import uim.apps;

class DAPPCheck : DAPPControllerComponent {
  mixin(APPControllerComponentThis!("APPCheck"));

  override void initialize() {
    super.initialize;

    this
    .name("APPCheck");
  }

  mixin(OProperty!("string", "redirectUrl"));
  mixin(OProperty!("string", "error"));
  mixin(OProperty!("DAPPCheck[]", "checks"));
  O addChecks(this O)(DAPPCheck[] newChecks) {
    this.checks(this.checks~newChecks);
    return cast(O)this;
  }

  bool execute(STRINGAA options = null) {
    foreach(check; checks) {
      if (!check.controller(this.controller).execute(options)) {
        this
        .error(check.error)
        .redirectUrl(check.redirectUrl);
        return false;
      }
    }
    return true;
  }
}
mixin(APPControllerComponentCalls!("APPCheck"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DAPPCheck);
    assert(APPCheck);
    assert(new DAPPCheck(APPController));
    assert(APPCheck(APPController));
  }
}