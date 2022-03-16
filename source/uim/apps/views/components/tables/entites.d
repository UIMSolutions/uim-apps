module uim.apps.views.components.tables.entities;

@safe:
import uim.apps;

class DAPPEntitiesTableViewComponent : DAPPTableViewComponent, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesTableViewComponent"));

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

  override void beforeH5(STRINGAA options = null) { 
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     if (auto entitiesHeader = cast(IAPPWithEntities)this.header) {
      entitiesHeader.entities(this.entities);
    }  */
  }
} 
mixin(ViewComponentCalls!("APPEntitiesTableViewComponent"));
