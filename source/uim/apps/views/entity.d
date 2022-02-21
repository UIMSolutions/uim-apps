module uim.apps.views.entity;

@safe:
import uim.apps;

class DAPPEntityView : DAPPView, IAPPWithEntity {
  mixin(APPViewThis!("APPEntityView"));

  mixin(OProperty!("DOOPEntity", "entity"));
  bool hasEntity() { 
    return (this.entity !is null); 
  } 
}
mixin(APPViewCalls!("APPEntityView"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPEntityView);
    assert(APPEntityView); 
  }
}