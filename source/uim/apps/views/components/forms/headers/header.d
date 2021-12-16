module uim.apps.views.components.forms.headers.header;

@safe:
import uim.apps;

class DAPPFormHeader : DAPPViewComponent {
  this() { super(); 
    this
    .id("formheader-%s".format(uniform(1,1_000)))
    .crudMode(CRUDModes.Create); }
  this(DAPPForm myForm) { this().form(myForm); }

  mixin(OProperty!("string", "id"));
  mixin(OProperty!("string", "title"));
  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("string", "mainTitle"));
  mixin(OProperty!("string", "subTitle"));
  mixin(OProperty!("string", "path"));
  mixin(OProperty!("string[]", "actions"));
  mixin(OProperty!("DAPPForm", "form"));

  DH5Obj[] h5Buttons(STRINGAA options = null) {
    return null;    
  }

  DH5Obj h5CardHeader(STRINGAA options = null) {
    return BS5CardHeader(id,
      H5H4(["card-title me-auto"], title),
      H5Div(["btn-list"], 
        H5Span(["d-none d-sm-inline"], h5Buttons(options))));    
  }

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);

    if (form) {
      this.crudMode(form.crudMode);
    }
  } 

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError) { return null; }

    return [h5CardHeader(options)];
  }
}
auto APPFormHeader() { return new DAPPFormHeader; }
auto APPFormHeader(DAPPForm myForm) { return new DAPPFormHeader(myForm); }
