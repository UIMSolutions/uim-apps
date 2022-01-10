module uim.apps.controllers.entities.entities;

@safe:
import uim.apps;

class DAPPEntitiesController : DAPPController, IAPPWithEntities {
  mixin(APPControllerThis!("APPEntitiesController"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(APPControllerCalls!("APPEntitiesController"));
