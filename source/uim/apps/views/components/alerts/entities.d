module uim.apps.views.components.alerts.entities;

@safe:
import uim.apps;

class DAPPEntitiesAlertViewComponent : DAPPAlertViewComponent, IAPPWithEntities {
  mixin(APPViewComponentThis!("APPEntitiesAlertViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(APPViewComponentCalls!("APPEntitiesAlertViewComponent"));