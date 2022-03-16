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

    if (auto entitiesHeader = cast(DEntitiesViewComponent)this.header) {
      entitiesHeader.entities(this.entities); 
    }
    if (auto entitiesContent = cast(DEntitiesViewComponent)this.content) {
      entitiesContent.entities(this.entities); 
    }
    if (auto entitiesFooter = cast(DEntitiesViewComponent)this.footer) {
      entitiesFooter.entities(this.entities); 
    }

    return cast(O)this;
  }
}
mixin(ViewComponentCalls!("EntitiesViewComponent"));