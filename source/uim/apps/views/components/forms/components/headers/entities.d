module uim.apps.views.components.forms.components.headers.entities;

@safe:
import uim.apps;

class DAPPEntitiesFormHeader : DAPPFormHeader, IAPPWithEntities {
  mixin(APPFormComponentThis!("APPEntitiesFormHeader", false, true));

  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesFormHeader~"DAPPEntitiesFormHeader::toHbeforeH55");
    super.beforeH5(options);
    if (hasError) { return; }

    if (auto entitiesForm = cast(IAPPWithEntities)this.form) {
      this.entities(entitiesForm.entities);
    }
  } 
}
mixin(APPFormComponentCalls!("APPEntitiesFormHeader", false, true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPEntitiesFormHeader);
    assert(APPEntitiesFormHeader);
    assert(new DAPPEntitiesFormHeader(APPForm));
    assert(APPEntitiesFormHeader(APPForm));
  }
}