module uim.apps.views.components.alerts.entity;

@safe:
import uim.apps;

class DAPPEntityAlertViewComponent : DAPPAlertViewComponent, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPEntityAlertViewComponent"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPViewComponentCalls!("APPEntityAlertViewComponent"));