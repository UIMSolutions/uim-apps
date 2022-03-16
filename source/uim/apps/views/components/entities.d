module uim.apps.views.components.entities;

@safe:
import uim.apps;

class DEntitiesViewComponent : DViewComponent {
  mixin(ViewComponentThis!("EntitiesViewComponent"));
  
  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  O entities(this O)(DOOPEntity[] newEntities) {
    _entities = newEntities;

    if (auto withEntities = cast(DEntitiesViewComponent)this.header) {
      withEntities.entities(this.entities); 
    }
    if (auto withEntities = cast(DEntitiesViewComponent)this.content) {
      withEntities.entities(this.entities); 
    }
    if (auto withEntities = cast(DEntitiesViewComponent)this.footer) {
      withEntities.entities(this.entities); 
    }

    return cast(O)this;
  }
}
mixin(ViewComponentCalls!("EntitiesViewComponent"));