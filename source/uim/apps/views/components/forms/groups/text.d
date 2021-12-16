module uim.apps.views.components.forms.groups.text;

@safe:
import uim.apps;

class DAPPTextFormGroup : DAPPFormGroup {
  this() { super(); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }


  override DH5Obj h5Input(STRINGAA options = null) {
    super.h5Input(options);

    auto input = BS5InputText(inputId, ["name": name, "autocomplete":"off", "placeholder":placeholder]);
    if (options.get("readonly", "") == "readonly") input.attribute("readonly","readonly");
    if (form && options.get("crudMode", "") != "create") {
      if (form.entity) { input.value(form.entity.name); }
      else { input.value(fieldValue); } 
    }

    return input;
  }

  override DH5Obj h5FormGroup(STRINGAA options = null) {
    super.h5FormGroup(options); 
 
    return 
      BS5FormGroup(["row", "mb-1"],
        H5Label(labelId, ["form-label col-2 col-form-label required"], label),
        BS5Col(["col"], 
          h5Input(options), 
          (invalidFeedback ? H5Div(["invalid-feedback"], invalidFeedback) : null)));
  }

  override void beforeH5(STRINGAA options = null) { // hook
    super.beforeH5(options);
    if (hasError) { return; }
    
    _h5Content ~= BS5FormGroup(id, ["row", "mb-1"],
      H5Label(labelId, ["form-label col-2 col-form-label required"], label),
      BS5Col(["col"], 
        h5Input(options), H5Div(["invalid-feedback"], invalidFeedback)));
  }
  unittest {
    version(uim_apps) {
      // 
      }}
}
mixin(APPFormComponentCalls!("APPTextFormGroup"));