module uim.apps.views.entities;

@safe:
import uim.apps;

class DAPPEntitiesView : DAPPView, IAPPWithEntities {
  mixin(APPViewThis!("APPEntitiesView", false, true));

  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DOOPEntity[] newEntities) {
    _entities = newEntities;

    if (auto withEntities = cast(IAPPWithEntities)this.leftComponent) {
      withEntities.entities(this.entities); 
    }
    if (auto withEntities = cast(IAPPWithEntities)this.mainComponent) {
      withEntities.entities(this.entities); 
    }
    if (auto withEntities = cast(IAPPWithEntities)this.rightComponent) {
      withEntities.entities(this.entities); 
    }
  }
}
mixin(APPViewCalls!("APPEntitiesView"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPEntitiesView);
    assert(APPEntitiesView); 
    assert(APPEntitiesView); 
  }
}