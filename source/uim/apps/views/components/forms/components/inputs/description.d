module uim.apps.views.components.forms.components.inputs.description;

@safe:
import uim.apps;

class DDescriptionFormInput : DTextAreaFormInput {
  mixin(FormComponentThis!("DescriptionFormInput", true));

  override void initialize() {
    super.initialize;
     
    this
    .id("entity_description")
    .inputName("entity_description")
    .fieldName("description")
    .label("Beschreibung")
    .placeholder("Beschreibung eingeben"); 
  }
}
mixin(FormComponentCalls!("DescriptionFormInput", true));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    // TODO Add Tests
}}