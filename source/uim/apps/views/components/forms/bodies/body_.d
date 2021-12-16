module uim.apps.views.components.forms.bodies.body_;

@safe:
import uim.apps;

class DAPPFormBody : DAPPViewComponent {
  this() { super(); 
    this.id("formbody-%s".format(uniform(1, 1_000)));
  }
  this(DAPPForm myForm) { this().form(myForm); }

  mixin(OProperty!("string", "id"));
  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("string", "path"));
  mixin(OProperty!("DAPPForm", "form"));

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
auto APPFormBody() { return new DAPPFormBody(); }
auto APPFormBody(DAPPForm myForm) { return new DAPPFormBody(myForm); }
