module uim.apps.views.components.forms.groups.startenddate;

@safe:
import uim.apps;

class DAPPStartEndDateFormGroup : DAPPFormGroup {
  this() { super(); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }


  DH5Obj h5StartInput(STRINGAA options = null) {
    super.h5Input(options);

    auto input = BS5InputDate("entity_validFrom", ["name":"entity_validFrom"]);
    if (readonly) {
      input.attribute("readonly","readonly");
    }
    if (this.crudMode != CRUDModes.Create) {
      if (entity) {
        input.value(entity["validFrom"]);
      }
    } 

    return input;
  }

  DH5Obj h5EndInput(STRINGAA options = null) {
    super.h5Input(options);

    auto input = BS5InputDate("entity_validUntil", ["name":"entity_validUntil"]);
    if (readonly) {
      input.attribute("readonly","readonly");
    }
    if (this.crudMode != CRUDModes.Create) {
      if (entity) {
        input.value(entity["validUntil"]);
      }
    } 

    return input;
  }

  override DH5Obj h5FormGroup(STRINGAA options = null) {
    super.h5FormGroup(options); 

    return
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col-5"], 
          H5Div(
            H5Label(["form-label mb-0"], "Ab"),
            H5Div(["input-icon"], 
              H5Span(["input-icon-addon"], tablerIcon("calendar")),
              h5StartInput(options)))),
        BS5Col(["col-5"], 
          H5Div(
            H5Label(["form-label mb-0"], "Bis"),
            H5Div(["input-icon"], 
              H5Span(["input-icon-addon"], tablerIcon("calendar")),
              h5EndInput(options)))));
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
mixin(APPFormComponentCalls!("APPStartEndDateFormGroup"));