module uim.apps.views.components.entities.entities;

@safe:
import uim.apps;

class DAPPEntitiesViewComponent : DAPPViewComponent, IAPPWithEntities {
  mixin(APPViewComponentThis!("APPEntitiesViewComponent", false, true));

  mixin(OProperty!("DOOPEntity[]", "entities"));
} 
mixin(APPViewComponentCalls!("APPEntitiesViewComponent", false, true));

version(test_uim_apps) {
  unittest {
    // TODO
  }
}