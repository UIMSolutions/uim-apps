module uim.apps.views.components.badges.entities;

@safe:
import uim.apps;

class DAPPEntitiesBadgeViewComponent : DAPPBadgeViewComponent, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesBadgeViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(ViewComponentCalls!("APPEntitiesBadgeViewComponent"));