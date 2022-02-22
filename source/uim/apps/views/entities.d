module uim.apps.views.entities;

@safe:
import uim.apps;

class DAPPEntitiesView : DAPPView, IAPPWithEntities {
  mixin(APPViewThis!("APPEntitiesView", false, true));

  protected DOOPEntity[] _entities;
  bool hasEntities() {
    return (_entities.length > 0);
  }  
  DOOPEntity[] entities() {
    return _entities;
  }  
  O entities(this O)(DOOPEntity[] newEntities) {
    _entities = newEntities;

    foreach(viewComponent; this.components) { 
      if (auto entitiesViewComponent = cast(DAPPEntitiesViewComponent)viewComponent) {
        entitiesViewComponent.entities(this.entities); 
      }
    } 
    return cast(O)this;
  }
}
mixin(APPViewCalls!("APPEntitiesView"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPEntitiesView);
    assert(APPEntitiesView); 
    assert(APPEntitiesView); 
  }
}