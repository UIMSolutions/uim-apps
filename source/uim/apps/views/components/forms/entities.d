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
    if (auto entitiesHeader = cast(DAPPEntitiesFormHeader)this.header) {
      entitiesHeader.entities(this.entities); 
    }
    if (auto entitiesBody = cast(DAPPEntitiesFormBody)this.body_) {
      entitiesBody.entities(this.entities); 
    }
    if (auto entitiesFooter = cast(DAPPEntitiesFormFooter)this.footer) {
      entitiesFooter.entities(this.entities); 
    }

    _afterSetEntities;

    return cast(O)this;
  }
  void _afterSetEntities() {
  }
}
mixin(APPFormCalls!("APPEntitiesForm"));
