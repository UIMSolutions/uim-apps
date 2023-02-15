module uim.apps.controllers.components.checks.check;

@safe:
import uim.apps;

class DControllerCheck : DControllerComponent {
  mixin(ControllerComponentThis!("APPCheck"));

  override void initialize() {
    super.initialize;

    this
    .name("APPCheck");
  }

  mixin(OProperty!("string", "redirectUrl"));
  mixin(OProperty!("DControllerCheck[]", "checks"));
  O addChecks(this O)(DControllerCheck[] newChecks) {
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
mixin(ControllerComponentCalls!("APPCheck"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DControllerCheck);
    assert(APPCheck);
    assert(new DControllerCheck(APPController));
    assert(APPCheck(APPController));
  }
}