module uim.apps.views.components.forms.components.groups.description;

@safe:
import uim.apps;

class DAPPDescriptionFormGroup : DAPPTextAreaFormGroup {
  mixin(APPFormComponentThis!("APPDescriptionFormGroup", true));

  override void initialize() {
    super.initialize;
     
    this
    .id("entity_description")
    .name("entity_description")
    .fieldName("description")
    .label("Beschreibung")
    .placeholder("Beschreibung eingeben"); 
  }
}
auto APPDescriptionFormGroup() { return new DAPPDescriptionFormGroup; }
auto APPDescriptionFormGroup(DAPPForm myForm) { return new DAPPDescriptionFormGroup(myForm); };
auto APPDescriptionFormGroup(DOOPEntity myEntity) { return new DAPPDescriptionFormGroup(myEntity); };
auto APPDescriptionFormGroup(DAPPForm myForm, DOOPEntity myEntity) { return new DAPPDescriptionFormGroup(myForm, myEntity); };


unittest {
  version(uim_apps) {
    // TODO Add Tests
}}