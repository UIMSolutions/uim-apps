module uim.apps.views.components.forms.components.headers.list;

@safe:
import uim.apps;

class DAPPListFormHeader : DAPPFormHeader {
  mixin(APPFormComponentThis!("APPListFormHeader"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPListFormHeader~"DAPPListFormHeader::toHbeforeH55");
    super.beforeH5(options);
    if (hasError) { return; }
  } 
}
mixin(APPFormComponentCalls!("APPListFormHeader"));