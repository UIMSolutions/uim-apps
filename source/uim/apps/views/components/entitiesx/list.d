module uim.apps.views.components.entitiesx.list;

@safe:
import uim.apps;

/* class DAPPEntitiesListViewComponent : DEntitiesViewComponent {
  mixin(ViewComponentThis!("APPEntitiesListViewComponent", false, true));

  mixin(OProperty!("DAPPListViewComponent", "listComponent"));

  override void initialize() {
    super.initialize;

    this
      .listComponent(APPListViewComponent);
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

    return listComponent.toH5(options);
  }  
} 
mixin(ViewComponentCalls!("APPEntitiesListViewComponent", false, true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO
  }
} */