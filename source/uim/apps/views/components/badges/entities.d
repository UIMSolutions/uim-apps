module uim.apps.views.components.badges.entities;

@safe:
import uim.apps;

class DAPPEntitiesBadgeViewComponent : DAPPBadgeViewComponent, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesBadgeViewComponent"));

  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DOOPEntity[] newEntities) {
    _entities = newEntities;

    if (auto withEntities = cast(IAPPWithEntities)this.header) {
      withEntities.entities(this.entities); 
    }
    if (auto withEntities = cast(IAPPWithEntities)this.content) {
      withEntities.entities(this.entities); 
    }
    if (auto withEntities = cast(IAPPWithEntities)this.footer) {
      withEntities.entities(this.entities); 
    }
  }
}
mixin(ViewComponentCalls!("APPEntitiesBadgeViewComponent"));