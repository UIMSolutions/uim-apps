module uim.apps.controllers.actions.action;

@safe:
import uim.apps;

class DAPPActionController : DAPPController {
  mixin(APPControllerThis!("APPActionController"));
}
mixin(APPControllerCalls!("APPActionController"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPActionController);
    assert(APPActionController);
    assert(APPActionController.name == "APPActionController");
  }
}
