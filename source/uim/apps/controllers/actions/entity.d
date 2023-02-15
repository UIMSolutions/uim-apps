module uim.apps.controllers.actions.entity;

@safe:
import uim.apps;

class DAPPEntityActionController : DAPPActionController {
  mixin(ControllerThis!("APPEntityActionController"));

  mixin(OProperty!("DEntity", "entity"));
}
mixin(ControllerCalls!("APPEntityActionController"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DAPPEntityActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPEntityActionController);
}}