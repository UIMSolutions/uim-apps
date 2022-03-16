module uim.apps.views.components.forms.components.contents.table;

@safe:
import uim.apps;

class DAPPTableFormContent : DEntitiesFormContent {
  mixin(APPFormComponentThis!("APPTableFormContent"));

  mixin(OProperty!("DEntityViewComponent", "row"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPTableFormContent~"::DAPPTableFormContent("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(APPFormComponentCalls!("APPTableFormContent"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPTableFormContent);
    assert(APPTableFormContent);
    assert(new DAPPTableFormContent(APPForm));
    assert(APPTableFormContent(APPForm));
  }
}