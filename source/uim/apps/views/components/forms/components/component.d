module uim.apps.views.components.forms.components.component;

@safe:
import uim.apps;

class DFormComponent : DViewComponent {
  mixin(ViewComponentThis!("FormComponent"));

  override void initialize() {
    debugMethodCall(moduleName!DFormComponent~"::DFormComponent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("DForm", "form"));
  mixin(OProperty!("bool", "readonly")); 

  mixin(APPParameter!("rootPath"));
  mixin(APPParameter!("title"));  
}
mixin(ViewComponentCalls!("FormComponent"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
  
    assert(new DFormComponent);
    assert(FormComponent);
    assert(FormComponent.name == "FormComponent");
    assert(FormComponent.name("test").name == "test");
    assert(FormComponent.rootPath("test2").rootPath == "test2");
    assert(FormComponent.title("test3").title == "test3");
}}