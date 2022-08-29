module uim.apps.views.components.forms.components.contents.table;

@safe:
import uim.apps;

class DAPPTableFormContent : DEntitiesFormContent {
  mixin(FormComponentThis!("APPTableFormContent"));

  mixin(OViewComponent!("row"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPTableFormContent~"::DAPPTableFormContent("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(FormComponentCalls!("APPTableFormContent"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPTableFormContent);
    assert(APPTableFormContent);
    assert(new DAPPTableFormContent(Form));
    assert(APPTableFormContent(Form));
  }
}