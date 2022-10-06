module uim.apps.views.components.forms.components.component;

@safe:
import uim.apps;

class DFormComponent : DAPPViewComponent {
  mixin(ViewComponentThis!("FormComponent"));

  override void initialize() {
    debugMethodCall(moduleName!DFormComponent~"::DFormComponent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("DForm", "form"));
  mixin(OProperty!("bool", "readonly")); 
  mixin(APPParameter!("title"));  
}
mixin(ViewComponentCalls!("FormComponent"));

version(test_uim_apps) { unittest {
  assert(FormComponent);
}}