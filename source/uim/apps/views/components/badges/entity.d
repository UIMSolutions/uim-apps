module uim.apps.views.components.badges.entity;

@safe:
import uim.apps;

class DAPPEntityBadgeViewComponent : DAPPBadgeViewComponent, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPEntityBadgeViewComponent"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPViewComponentCalls!("APPEntityBadgeViewComponent"));