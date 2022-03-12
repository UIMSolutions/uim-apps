module uim.apps.controllers.actions.entities;

@safe:
import uim.apps;

class DAPPEntitiesActionController : DAPPActionController, IAPPWithEntities {
  mixin(APPControllerThis!("APPEntitiesActionController"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(APPControllerCalls!("APPEntitiesActionController"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new APPEntitiesActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPEntitiesActionController);
}}