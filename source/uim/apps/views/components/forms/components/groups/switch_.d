module uim.apps.views.components.forms.components.groups.switch_;

@safe:
import uim.apps;

class DAPPSwitchFormGroup : DFormGroup {
  mixin(FormComponentThis!("APPSwitchFormGroup", true));

  override void initialize() {
    super.initialize;

    this
      .fieldValue("false");
  }

  mixin(OProperty!("bool", "checked"));
 
  override DH5Obj h5Input(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPSwitchFormGroup~":DAPPSwitchFormGroup::h5Input");
    super.h5Input(options);
    
    auto input = H5Input(name, ["form-check-input me-1"], ["type":"checkbox", "name":inputName]);
    if (entity) {
      this.checked = (entity[fieldName] == "true"); 
    }
    if (checked) input.attribute("checked", "checked");    

    if (crudMode != CRUDModes.Create) input.value(fieldValue);
    if (crudMode == CRUDModes.Read || crudMode == CRUDModes.Delete) input.attribute("readonly","readonly").attribute("disabled","disabled");

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
mixin(FormComponentCalls!("APPSwitchFormGroup", true));
