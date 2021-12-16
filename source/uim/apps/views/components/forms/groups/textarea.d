module uim.apps.views.components.forms.groups.textarea;

@safe:
import uim.apps;

class DAPPTextAreaFormGroup : DAPPFormGroup {
  this() { super();
   this
   .rows("3").autocomplete("off"); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }


  mixin(OProperty!("string", "rows"));
  mixin(OProperty!("string", "autocomplete"));

  override void beforeH5(STRINGAA options = null) { // hook
    super.beforeH5(options);
    if (hasError) { return; }
    
    auto input = BS5InputTextarea(id, ["rows":rows, "name":name, "autocomplete":autocomplete, "placeholder":placeholder]);
    if (options.get("readonly", "") == "readonly") input.attribute("readonly","readonly");
    if (form && options.get("crudMode", "") != "create") input(form.entity.description);

    _h5Content ~=  BS5FormGroup(["row", "mb-1"],
      H5Label(["form-label col-2 col-form-label"], label),
      BS5Col(["col"], input));
  }
  unittest {
    version(uim_apps) {
      // 
      }}
}
mixin(APPFormComponentCalls!("APPTextAreaFormGroup"));