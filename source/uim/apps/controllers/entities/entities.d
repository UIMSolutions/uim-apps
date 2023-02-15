module uim.apps.controllers.entities.entities;

@safe:
import uim.apps;

class DAPPEntitiesController : DAPPController {
  mixin(APPControllerThis!("APPEntitiesController"));

  protected DEntity[] _entities;
  DEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DEntity[] newEntities) {
    _entities = newEntities;
  }
}
mixin(APPControllerCalls!("APPEntitiesController"));
