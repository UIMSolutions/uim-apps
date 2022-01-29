module uim.apps.views.components.forms.components.groups.description;

@safe:
import uim.apps;

class DAPPDescriptionFormGroup : DAPPTextAreaFormGroup {
  mixin(APPFormComponentThis!("APPDescriptionFormGroup", true));

  override void initialize() {
    super.initialize;
     
    this
    .id("entity_description")
    .formName("entity_description")
    .fieldName("description")
    .label("Beschreibung")
    .placeholder("Beschreibung eingeben"); 
  }
}
mixin(APPFormComponentCalls!("APPDescriptionFormGroup", true));

unittest {
  version(test_uim_apps) {
    // TODO Add Tests
}}