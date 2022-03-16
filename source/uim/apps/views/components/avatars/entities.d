module uim.apps.views.components.avatars.entities;

@safe:
import uim.apps;

class DAPPEntitiesAvatarViewComponent : DAPPAvatarViewComponent, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesAvatarViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(ViewComponentCalls!("APPEntitiesAvatarViewComponent"));