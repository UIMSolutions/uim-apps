module uim.apps.controllers.actions.action;

@safe:
import uim.apps;

class DAPPActionController : DAPPController {
  mixin(APPControllerThis!("APPActionController"));
}
mixin(APPControllerCalls!("APPActionController"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DAPPActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPActionController);
}}