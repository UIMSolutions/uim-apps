module uim.apps.controller.components.checks.requests.password;

@safe:
import uim.apps;

class DAPPCheckHasPasswordInRequest : DAPPCheck {
  mixin(AppControllerComponentThis!("APPCheckHasPasswordInRequest"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckHasPasswordInRequest~":DAPPCheckHasPasswordInRequest::execute");
    super.execute(options);

    return (options.get("loginPW", null).length > 0);
  }
}
mixin(AppControllerComponentCalls!("APPCheckHasPasswordInRequest"));
