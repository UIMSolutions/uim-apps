module uim.apps.views.components.forms.components.groups.checkbox;

@safe:
import uim.apps;

class DAPPCheckboxFormGroup : DAPPFormGroup {
  mixin(APPFormComponentThis!("APPCheckboxFormGroup", true));

  override void initialize() {
    super.initialize;

    this
      .fieldValue("false");
  }

  mixin(OProperty!("bool", "checked"));
 
  override DH5Obj h5Input(STRINGAA options = null) {
    super.h5Input(options); 

    auto input = H5Input(name, ["form-check-input me-1"], ["type":"checkbox", "name":formName]);
    if (!checked) this.checked("checked" in options && options["checked"] == "checked");
    if (checked) input.attribute("checked", "checked");    
    if (entity) { this.fieldValue = entity[fieldName]; }
    if (_crudMode != CRUDModes.Create) input.value(fieldValue);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");

    return input;
  }
  
  override DH5Obj h5FormGroup(STRINGAA options = null) {
    super.h5FormGroup(options);

    return BS5FormGroup(["row", "mb-0"],
      H5Label(["form-label col-2 col-form-label"], ""),
      BS5Col(["col"], 
        H5Label(["form-check form-switch"], 
          h5Input(options), H5Span(["form-check-label"], label))));
  }
}
mixin(APPFormComponentCalls!("APPCheckboxFormGroup"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPCheckboxFormGroup);
    assert(APPCheckboxFormGroup);
  }
}