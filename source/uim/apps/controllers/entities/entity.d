module uim.apps.controllers.entities.entity;

@safe:
import uim.apps;

class DAPPEntityController : DAPPController, IAPPWithEntity {
  mixin(APPControllerThis!("APPEntityController"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPControllerCalls!("APPEntityController"));
