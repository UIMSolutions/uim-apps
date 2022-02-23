module uim.apps.views.components.forms.components.component;

@safe:
import uim.apps;

class DAPPFormComponent : DAPPViewComponent {
  mixin(APPViewComponentThis!("APPFormComponent"));

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("DAPPForm", "form"));
  mixin(OProperty!("bool", "readonly")); 

  mixin(APPParameter!("rootPath"));
  mixin(APPParameter!("title"));  
}
mixin(APPViewComponentCalls!("APPFormComponent"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
  
    assert(new DAPPFormComponent);
    assert(APPFormComponent);
    assert(APPFormComponent.name == "APPFormComponent");
    assert(APPFormComponent.name("test").name == "test");
    assert(APPFormComponent.rootPath("test2").rootPath == "test2");
    assert(APPFormComponent.title("test3").title == "test3");
}}