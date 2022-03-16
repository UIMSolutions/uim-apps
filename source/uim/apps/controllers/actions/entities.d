module uim.apps.controllers.actions.entities;

@safe:
import uim.apps;

class DAPPEntitiesActionController : DAPPActionController, IAPPWithEntities {
  mixin(APPControllerThis!("APPEntitiesActionController"));

  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DOOPEntity[] newEntities) {
    _entities = newEntities;
  }
}
mixin(APPControllerCalls!("APPEntitiesActionController"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new APPEntitiesActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPEntitiesActionController);
}}