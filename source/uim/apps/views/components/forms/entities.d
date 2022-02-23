module uim.apps.views.components.forms.entities;

@safe:
import uim.apps;

class DAPPEntitiesForm : DAPPForm, IAPPWithEntities {
  mixin(APPFormThis!("APPEntitiesForm"));

protected DOOPEntity[] _entities;
  bool hasEntities() {
    return (_entities.length > 0);
  }  
  DOOPEntity[] entities() {
    return _entities;
  }  
  O entities(this O)(DOOPEntity[] newEntities) {
    _entities = newEntities;

    foreach(formComponent; this.components) { 
      if (auto entitiesComponent = cast(DAPPEntitiesViewComponent)formComponent) {
        entitiesComponent.entities(this.entities); 
      }
    } 

    _afterSetEntities;

    return cast(O)this;
  }
  void _afterSetEntities() {
  }
}
mixin(APPFormCalls!("APPEntitiesForm"));
