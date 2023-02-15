module uim.apps.controllers.actions.entities;

@safe:
import uim.apps;

class DAPPEntitiesActionController : DAPPActionController {
  mixin(APPControllerThis!("APPEntitiesActionController"));

  protected DEntity[] _entities;
  DEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DEntity[] newEntities) {
    _entities = newEntities;
  }
}
mixin(APPControllerCalls!("APPEntitiesActionController"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new APPEntitiesActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPEntitiesActionController);
}}