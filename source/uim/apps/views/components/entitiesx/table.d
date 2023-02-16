module uim.apps.views.components.entitiesx.table;

@safe:
import uim.apps;

/* class DAPPEntitiesTableViewComponent : DAPPViewComponent {
  mixin(ViewComponentThis!("APPEntitiesTableViewComponent", false, true));

  mixin(OProperty!("DAPPTableViewComponent", "tableComponent"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this
      .tableComponent(APPTableViewComponent);
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DForm~":DForm("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DForm~":DForm("~this.name~")::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    return tableComponent.toH5(options);
  }  
} 
mixin(ViewComponentCalls!("APPEntitiesTableViewComponent", false, true));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO
  }
} */