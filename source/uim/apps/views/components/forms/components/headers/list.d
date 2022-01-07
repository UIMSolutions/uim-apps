module uim.apps.views.components.forms.components.headers.list;

@safe:
import uim.apps;

class DAPPListFormHeader : DAPPFormHeader, IAPPWithEntities {
  mixin(APPFormComponentThis!("APPListFormHeader", false, true));

 mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPListFormHeader~"DAPPListFormHeader::toHbeforeH55");
    super.beforeH5(options);
    if (hasError) { return; }

    if (auto entitiesForm = cast(IAPPWithEntities)this.form) {
      this.entities(entitiesForm.entities);
    }
  } 
}
mixin(APPFormComponentCalls!("APPListFormHeader", false, true));

version(test_uim_apps) {
  unittest {
    assert(new DAPPListFormHeader);
    assert(APPListFormHeader);
    assert(new DAPPListFormHeader(APPController));
    assert(APPListFormHeader(APPController));
  }
}