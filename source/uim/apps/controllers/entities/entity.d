module uim.apps.controllers.entities.entity;

@safe:
import uim.apps;

class DAPPEntityController : DAPPController {
  mixin(APPControllerThis!("APPEntityController"));

  mixin(OProperty!("DEntity", "entity"));
}
mixin(APPControllerCalls!("APPEntityController"));
