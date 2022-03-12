module uim.apps.views.components.avatars.entity;

@safe:
import uim.apps;

class DAPPEntityAvatarViewComponent : DAPPAvatarViewComponent, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPEntityAvatarViewComponent"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPViewComponentCalls!("APPEntityAvatarViewComponent"));