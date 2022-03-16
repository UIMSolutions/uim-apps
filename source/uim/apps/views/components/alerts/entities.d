module uim.apps.views.components.alerts.entities;

@safe:
import uim.apps;

class DAPPEntitiesAlertViewComponent : DAPPAlertViewComponent, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesAlertViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(ViewComponentCalls!("APPEntitiesAlertViewComponent"));