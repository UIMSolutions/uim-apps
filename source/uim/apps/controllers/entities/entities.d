module uim.apps.controllers.entities.entities;

@safe:
import uim.apps;

class DAPPEntitiesController : DAPPController, IAPPWithEntities {
  mixin(APPControllerThis!("APPEntitiesController"));

  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DOOPEntity[] newEntities) {
    _entities = newEntities;
  }
}
mixin(APPControllerCalls!("APPEntitiesController"));
