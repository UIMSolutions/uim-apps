module uim.apps.views.components.forms.components.groups.date;

@safe:
import uim.apps;

class DAPPDateFormGroup : DAPPFormGroup {
  mixin(APPFormComponentThis!("APPDateFormGroup", true));

  override void initialize() {
    super.initialize;
  }

  override DH5Obj h5Input(STRINGAA options = null) {
    super.h5Input(options);

    auto input = BS5InputDate("entity_validFrom", ["name":"entity_validFrom"]);
    if (readonly) input.attribute("readonly","readonly");
    if (this.crudMode != CRUDModes.Create) {
      input.value(entity["validFrom"]);
    }
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");

    return input;
  }

  override DH5Obj h5FormGroup(STRINGAA options = null) {
    super.h5FormGroup(options); 

    return
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], h5Input(options)));
  }

  override void beforeH5(STRINGAA options = null) { // hook
    super.beforeH5(options);
    if (hasError) { return; }
  }
  unittest {
    version(uim_apps) {
      // 
      }}
}
auto APPDateFormGroup() { return new DAPPDateFormGroup; }
auto APPDateFormGroup(DAPPForm myForm) { return new DAPPDateFormGroup(myForm); }
auto APPDateFormGroup(DOOPEntity myEntity) { return new DAPPDateFormGroup(myEntity); }
auto APPDateFormGroup(DAPPForm myForm, DOOPEntity myEntity) { return new DAPPDateFormGroup(myForm, myEntity); }