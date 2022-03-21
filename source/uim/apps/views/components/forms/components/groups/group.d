module uim.apps.views.components.forms.components.groups.group;

@safe:
import uim.apps;

class DFormGroup : DFormComponent {
  mixin(FormComponentThis!("FormGroup"));

  // id of label element
  mixin(OProperty!("string", "labelId")); 

  // id of input element
  mixin(OProperty!("string", "inputId")); 
  mixin(OProperty!("string", "inputName"));
  mixin(OProperty!("string", "fieldName"));
  mixin(OProperty!("string", "fieldValue"));
  mixin(OProperty!("string", "label"));
  mixin(OProperty!("string", "placeholder"));
  mixin(OProperty!("string", "invalidFeedback"));
  mixin(OProperty!("string[]", "fields"));
  mixin(OProperty!("string", "path"));
  mixin(OProperty!("DAPPPanes", "panes"));

  override void initialize() {
    super.initialize();

    this
      .id("formgroup-%s".format(uniform(1, 1_000)))
      .labelId(id~"-label")
      .inputId(id~"-input")
      .crudMode(CRUDModes.Create)
      .fields(["name", "display", "description"]); 
  }

  DH5Obj h5Input(STRINGAA options = null) {
    auto input = H5Input(inputId, ["type": "text"]);
    if (crudMode == CRUDModes.Read || crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");

    return input;
  }

  DH5Obj h5FormGroup(STRINGAA options = null) {
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

    if (this.form) { // Owner Class
      this.crudMode(this.form.crudMode);
    }
  }
  version(test_uim_apps) {
    unittest {
      writeln("--- Test in ", __MODULE__, "/", __LINE__);
      // 
      }}

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError) { return null; }

    return [
      h5FormGroup(options)
      ];
  }
}
mixin(FormComponentCalls!("FormGroup"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DFormGroup);
    assert(FormGroup);
  }
}