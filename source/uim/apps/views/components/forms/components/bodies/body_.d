module uim.apps.views.components.forms.components.bodies.body_;

@safe:
import uim.apps;

class DAPPFormBody : DAPPFormComponent {
  mixin(APPFormComponentThis!("APPFormHeader"));

  override void initialize() {
    super.initialize;

    this
    .id("formbody-%s".format(uniform(1, 1_000)));
  }

  DH5Obj[] formGroup(string field, bool readOnly, STRINGAA options = null) {
    if (readOnly) { options["readonly"] = "readonly"; }
    
    return null;
  }  

  DH5Obj bodyContent(STRINGAA options = null) {
    return 
      BS5Row();
  }
  
  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError) { return; }

    if (form) {
      this.crudMode(form.crudMode);
    }
  }
}
mixin(APPFormComponentCalls!("APPFormBody"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPFormBody);
    assert(APPFormBody);
    assert(new DAPPFormBody(APPController));
    assert(APPFormBody(APPController));
  }
}
