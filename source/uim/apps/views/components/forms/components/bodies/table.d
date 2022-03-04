module uim.apps.views.components.forms.components.bodies.table;

@safe:
import uim.apps;

class DAPPTableFormBody : DAPPEntitiesFormBody {
  mixin(APPFormComponentThis!("APPTableFormBody"));

  mixin(OProperty!("DAPPEntityViewComponent", "row"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPTableFormBody~"::DAPPTableFormBody("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(APPFormComponentCalls!("APPTableFormBody"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPTableFormBody);
    assert(APPTableFormBody);
    assert(new DAPPTableFormBody(APPForm));
    assert(APPTableFormBody(APPForm));
  }
}