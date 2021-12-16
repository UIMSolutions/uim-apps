module uim.apps.views.components.forms.headers.list;

@safe:
import uim.apps;

class DAPPListFormHeader : DAPPFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }

  override DH5Obj[] h5Buttons(STRINGAA options = null) {
    return super.h5Buttons(options);
  }

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError) { return; }
  } 
}
auto APPListFormHeader() { return new DAPPListFormHeader; }
auto APPListFormHeader(DAPPForm myForm) { return new DAPPListFormHeader(myForm); }