module uim.apps.controllers.components.checks.check;

@safe:
import uim.apps;

class DAPPCheck : DAPPControllerComponent {
  this() { super(); }
  this(DAPPController myController) { this().controller(myController); }

  override void initialize() {
    super.initialize;

    this
    .name("APPCheck");
  }

  mixin(OProperty!("string", "redirectUrl"));
  mixin(OProperty!("string", "error"));
  mixin(OProperty!("DAPPCheck[]", "checks"));

  bool execute(STRINGAA options = null) {
    foreach(check; checks) {
      if (this.controller) check.controller(this.controller);
      if (!check.execute(options)) {
        this
        .error(check.error)
        .redirectUrl(check.redirectUrl);
        return false;
      }
    }
    return true;
  }
}