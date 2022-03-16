module uim.apps.views.components.alerts.entities;

@safe:
import uim.apps;

class DAPPEntitiesAlertViewComponent : DAPPAlertViewComponent, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesAlertViewComponent"));

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
mixin(ViewComponentCalls!("APPEntitiesAlertViewComponent"));