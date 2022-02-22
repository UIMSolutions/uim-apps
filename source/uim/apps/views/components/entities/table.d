module uim.apps.views.components.entities.table;

@safe:
import uim.apps;

class DAPPEntitiesTableViewComponent : DAPPEntitiesViewComponent {
  mixin(APPViewComponentThis!("APPEntitiesTableViewComponent", false, true));

  mixin(OProperty!("DAPPTableViewComponent", "tableComponent"));

  override void initialize() {
    super.initialize;

    this
      .tableComponent(APPTableViewComponent);
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPForm~":DAPPForm("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPForm~":DAPPForm("~this.name~")::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    return tableComponent.toH5(options);
  }  
} 
mixin(APPViewComponentCalls!("APPEntitiesTableViewComponent", false, true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO
  }
}