module uim.apps.views.components.forms.components.groups.text;

@safe:
import uim.apps;

class DAPPTextFormGroup : DEntityFormGroup {
  mixin(APPFormComponentThis!("APPTextFormGroup", true));

  override DH5Obj h5Input(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPTextFormGroup~":DAPPTextFormGroup::h5Input");
    super.h5Input(options);

    debug writeln("Entity -> ", entity ? entity.name : "'null'"); 
    super.h5Input(options);
    debug writeln("Entity -> ", entity ? entity.name : "'null'"); 
    debug writeln("FieldValue -> ", fieldValue); 

    auto input = BS5InputText(inputId, ["name": inputName, "autocomplete":"off", "placeholder":placeholder]);
    if (readonly) input.attribute("readonly","readonly");
    if (crudMode == CRUDModes.Read || crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");
    input.value(fieldValue); 

    return input;
  }

  override DH5Obj h5FormGroup(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPTextFormGroup~":DAPPTextFormGroup::h5FormGroup");
    super.h5FormGroup(options); 
 
    return 
      BS5FormGroup(["row", "mb-1"],
        H5Label(labelId, ["form-label col-2 col-form-label required"], label),
        BS5Col(["col"], 
          h5Input(options), 
          (invalidFeedback ? H5Div(["invalid-feedback"], invalidFeedback) : null)));
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    return [
      BS5FormGroup(id, ["row", "mb-1"],
        H5Label(labelId, ["form-label col-2 col-form-label required"], label),
        BS5Col(["col"], 
          h5Input(options), H5Div(["invalid-feedback"], invalidFeedback)))
    ].toH5;
  }
  version(test_uim_apps) {
    unittest {
      writeln("--- Test in ", __MODULE__, "/", __LINE__);
      // 
      }}
}
mixin(APPFormComponentCalls!("APPTextFormGroup", true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

  }}
