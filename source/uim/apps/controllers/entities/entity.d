module uim.apps.controllers.entities.entity;

@safe:
import uim.apps;

class DAPPEntityController : DController {
  mixin(ControllerThis!("APPEntityController"));

  mixin(OProperty!("DEntity", "entity"));
}
mixin(ControllerCalls!("APPEntityController"));
