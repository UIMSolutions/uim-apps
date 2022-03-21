module uim.apps.controllers.actions.entity;

@safe:
import uim.apps;

class DAPPEntityActionController : DAPPActionController {
  mixin(APPControllerThis!("APPEntityActionController"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPControllerCalls!("APPEntityActionController"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DAPPEntityActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPEntityActionController);
}}