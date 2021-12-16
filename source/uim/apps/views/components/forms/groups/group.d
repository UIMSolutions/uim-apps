module uim.apps.views.components.forms.groups.group;

@safe:
import uim.apps;

class DAPPFormGroup : DAPPViewComponent {
  this() { super(); 
    this
    .id("formgroup-%s".format(uniform(1, 1_000)))
    .labelId(id~"-label")
    .inputId(id~"-input")
    .crudMode(CRUDModes.Create)
    .fields(["name", "display", "description"]); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }


  // id of formgroup
  mixin(OProperty!("string", "id")); 

  // id of label element
  mixin(OProperty!("string", "labelId")); 

  // id of input element
  mixin(OProperty!("string", "inputId")); 
  mixin(OProperty!("string", "fieldName"));
  mixin(OProperty!("string", "fieldValue"));
  mixin(OProperty!("bool", "readonly"));
  mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("string", "label"));
  mixin(OProperty!("string", "placeholder"));
  mixin(OProperty!("string", "invalidFeedback"));
  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("string[]", "fields"));
  mixin(OProperty!("string", "path"));
  mixin(OProperty!("DAPPPanes", "panes"));
  mixin(OProperty!("DAPPForm", "form"));

  DH5Obj h5Input(STRINGAA options = null) {
    return H5Input(inputId, ["type", "text"]);
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

    // read data from form
    if (form) {
      this.crudMode = form.crudMode;

      if (auto entityForm = cast(DAPPEntityForm)form) {
        this.entity(entityForm.entity);
      }
    }

    if (entity) {
      this.fieldValue = entity[fieldName];
    }
  }
  unittest {
    version(uim_apps) {
      // 
      }}

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError) { return null; }

    return [h5FormGroup(options)];
  }
}
mixin(APPFormComponentCalls!("APPFormGroup"));
