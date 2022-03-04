module uim.apps.views.components.forms.components.groups.entity;

@safe:
import uim.apps;

class DAPPEntityFormGroup : DAPPFormGroup, IAPPWithEntity {
  mixin(APPFormComponentThis!("APPEntityFormGroup", true));

  mixin(OProperty!("DOOPEntity", "entity"));

  override void beforeH5(STRINGAA options = null) { // hook
    super.beforeH5(options);
    if (hasError) { return; }

    debug writeln(entity ? "Has entity" : "no entity");
    if (this.entity) {      
      this.fieldValue = this.entity[this.fieldName];
    }

    if (this.form) { // Owner class
      if (auto entityForm = cast(DAPPEntityForm)this.form) {
        this.entity = entityForm.entity;
      }
    }
  }
  version(test_uim_apps) {
    unittest {
      writeln("--- Test in ", __MODULE__, "/", __LINE__);
      // 
      }}
}
mixin(APPFormComponentCalls!("APPEntityFormGroup", true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new APPEntityFormGroup);
    assert(APPEntityFormGroup);
  }
}