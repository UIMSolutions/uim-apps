module uim.apps.views.components.forms.components.groups.textarea;

@safe:
import uim.apps;

class DAPPTextAreaFormGroup : DAPPFormGroup {
  mixin(APPFormComponentThis!("APPTextAreaFormGroup"));
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }

  override void initialize() {
    super.initialize;

    this
      .rows("3")
      .autocomplete("off"); 
  }

  mixin(OProperty!("string", "rows"));
  mixin(OProperty!("string", "autocomplete"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    auto input = BS5InputTextarea(id, ["rows":rows, "name":name, "autocomplete":autocomplete, "placeholder":placeholder], entity ? entity[fieldName] : "");
    if (readonly) input.attribute("readonly","readonly");
    if (crudMode == CRUDModes.Read || crudMode == CRUDModes.Delete) input.attribute("readonly","readonly");

    return [
      BS5FormGroup(["row", "mb-1"],
      H5Label(["form-label col-2 col-form-label"], label),
      BS5Col(["col"], input))].toH5;
  }
  unittest {
    version(uim_apps) {
      // 
      }}
}
mixin(APPFormComponentCalls!("APPTextAreaFormGroup"));