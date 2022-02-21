module uim.apps.controllers.pages.entities;

@safe:
import uim.apps;

class DAPPEntitiesPageController : DAPPPageController, IAPPWithEntities {
  mixin(APPControllerThis!("APPEntitiesPageController"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(APPControllerCalls!("APPEntitiesPageController"));
