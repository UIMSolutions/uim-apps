module uim.apps.views.components.avatars.entities;

@safe:
import uim.apps;

class DAPPEntitiesAvatarViewComponent : DAPPAvatarViewComponent, IAPPWithEntities {
  mixin(APPViewComponentThis!("APPEntitiesAvatarViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(APPViewComponentCalls!("APPEntitiesAvatarViewComponent"));