module uim.apps.views.components.entities.entities;

@safe:
import uim.apps;

class DAPPEntitiesViewComponent : DAPPViewComponent, IAPPWithEntities {
  mixin(APPViewComponentThis!("APPEntitiesViewComponent", false, true));

  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPView~":DAPPView::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln(entities ? "has entities" : "no entities");
  }
} 
mixin(APPViewComponentCalls!("APPEntitiesViewComponent", false, true));

version(test_uim_apps) {
  unittest {
    // TODO
  }
}