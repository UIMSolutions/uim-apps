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

    debug writeln("Found entities: %s".format(entities.length));
    foreach(formComponent; this.components) { 
      if (auto entitiesComponent = cast(DAPPEntitiesViewComponent)formComponent) {
        entitiesComponent.entities(this.entities); 
      }
    } 
    if (auto entitiesHeader = cast(DAPPEntitiesFormHeader)this.header) {
      debug writeln("Found entitiesHeader: "~entitiesHeader.name);
      entitiesHeader.entities(this.entities); 
    }
    if (auto entitiesBody = cast(DAPPEntitiesFormBody)this.body_) {
      debug writeln("Found entitiesBody: "~entitiesBody.name);
      entitiesBody.entities(this.entities); 
    }
    if (auto entitiesFooter = cast(DAPPEntitiesFormFooter)this.footer) {
      debug writeln("Found entitiesFooter: "~entitiesFooter.name);
      entitiesFooter.entities(this.entities); 
    }

    _afterSetEntities;

    return cast(O)this;
  }
  void _afterSetEntities() {
  }
}
mixin(APPFormCalls!("APPEntitiesForm"));
