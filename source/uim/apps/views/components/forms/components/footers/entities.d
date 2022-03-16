module uim.apps.views.components.forms.components.footers.entities;

@safe:
import uim.apps;

class DEntitiesFormFooter : DFormFooter, IAPPWithEntities {
  mixin(APPFormComponentThis!("EntitiesFormFooter", false, true));

  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  O entities(this O)(DOOPEntity[] newEntities) { 
    _entities = newEntities;

    if (auto entitiesContent = cast(DEntitiesViewComponent)this.content) {
      entitiesContent.entities(this.entities); 
    }
    else if (auto entitiesContent = cast(DEntitiesFormContent)this.content) {
      entitiesContent.entities(this.entities); 
    }

    return cast(O)this;
  }
}
mixin(APPFormComponentCalls!("EntitiesFormFooter", false, true));

