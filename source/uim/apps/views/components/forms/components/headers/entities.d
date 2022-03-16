module uim.apps.views.components.forms.components.headers.entities;

@safe:
import uim.apps;

class DEntitiesFormHeader : DAPPFormHeader, IAPPWithEntities {
  mixin(APPFormComponentThis!("EntitiesFormHeader", false, true));

  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DOOPEntity[] newEntities) {
    _entities = newEntities;

    if (auto withEntities = cast(IAPPWithEntities)this.header) {
      withEntities.entities(this.entities); 
    }
    if (auto withEntities = cast(IAPPWithEntities)this.content) {
      withEntities.entities(this.entities); 
    }
    if (auto withEntities = cast(IAPPWithEntities)this.footer) {
      withEntities.entities(this.entities); 
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesFormHeader~"DEntitiesFormHeader::toHbeforeH55");
    super.beforeH5(options);
    if (hasError) { return; }

    if (auto entitiesForm = cast(IAPPWithEntities)this.form) {
      this.entities(entitiesForm.entities);
    }
  } 
}
mixin(APPFormComponentCalls!("EntitiesFormHeader", false, true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DEntitiesFormHeader);
    assert(EntitiesFormHeader);
    assert(new DEntitiesFormHeader(APPForm));
    assert(EntitiesFormHeader(APPForm));
  }
}