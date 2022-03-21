module uim.apps.views.components.forms.components.headers.entities;

@safe:
import uim.apps;

class DEntitiesFormHeader : DFormHeader {
  mixin(FormComponentThis!("EntitiesFormHeader", false, true));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesFormHeader~"DEntitiesFormHeader::toHbeforeH55");
    super.beforeH5(options);
    if (hasError) { return; }

    if (auto entitiesForm = cast(IAPPWithEntities)this.form) {
      this.entities(entitiesForm.entities);
    }
  } 
}
mixin(FormComponentCalls!("EntitiesFormHeader", false, true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DEntitiesFormHeader);
    assert(EntitiesFormHeader);
    assert(new DEntitiesFormHeader(Form));
    assert(EntitiesFormHeader(Form));
  }
}