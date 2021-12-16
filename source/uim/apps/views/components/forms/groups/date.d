module uim.apps.views.components.forms.groups.date;

@safe:
import uim.apps;

class DAPPDateFormGroup : DAPPFormGroup {
  this() { super(); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }


  override DH5Obj h5Input(STRINGAA options = null) {
    super.h5Input(options);

    auto input = BS5InputDate("entity_validFrom", ["name":"entity_validFrom"]);
    if (readonly) input.attribute("readonly","readonly");
    if (this.crudMode != CRUDModes.Create) {
      input.value(entity["validFrom"]);
    }

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