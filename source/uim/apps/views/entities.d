module uim.apps.views.entities;

@safe:
import uim.apps;

class DAPPEntitiesView : DAPPView, IAPPWithEntities {
  mixin(APPViewThis!("APPEntitiesView", false, true));

  mixin(OProperty!("DOOPEntity[]", "entities"));
  bool hasEntities() { 
    return this.entities.length > 0; 
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