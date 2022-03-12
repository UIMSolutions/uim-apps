module uim.apps.views.components.badges.entities;

@safe:
import uim.apps;

class DAPPEntitiesBadgeViewComponent : DAPPBadgeViewComponent, IAPPWithEntities {
  mixin(APPViewComponentThis!("APPEntitiesBadgeViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(APPViewComponentCalls!("APPEntitiesBadgeViewComponent"));