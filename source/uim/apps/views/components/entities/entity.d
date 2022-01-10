module uim.apps.views.components.entities.entity;

@safe:
import uim.apps;

class DAPPEntityViewComponent : DAPPViewComponent, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPEntityViewComponent", true));

  mixin(OProperty!("DOOPEntity", "entity"));
} 
mixin(APPViewComponentCalls!("APPEntityViewComponent", true));

version(test_uim_apps) {
  unittest {
    // TODO
  }
}