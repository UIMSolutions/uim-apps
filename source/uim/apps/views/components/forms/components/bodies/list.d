module uim.apps.views.components.forms.components.bodies.list;

@safe:
import uim.apps;

class DAPPListFormBody : DAPPFormBody {
  mixin(APPFormComponentThis!("APPListFormBody"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPListFormBody~"::DAPPListFormBody("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(APPFormComponentCalls!("APPListFormBody"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPListFormBody);
    assert(APPListFormBody);
    assert(new DAPPListFormBody(APPForm));
    assert(APPListFormBody(APPForm));
  }
}