module uim.apps.controllers.pages.entity;

@safe:
import uim.apps;

class DAPPEntityPageController : DAPPPageController, IAPPWithEntity {
  mixin(APPControllerThis!("APPEntityPageController"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPControllerCalls!("APPEntityPageController"));
