module uim.apps.views.components.forms.components.inputs.display;

@safe:
import uim.apps;

class DDisplayFormInput : DTextFormInput {
  mixin(FormComponentThis!("DisplayFormInput", true));

  override void initialize() {
    super.initialize();

    this
    .id("entity_display")
    .inputName("entity_display")
    .fieldName("display")
    .label("Titel")
    .placeholder("Titel eingeben")
    .invalidFeedback("Titel ist nicht korrekt"); 
  }
}
mixin(FormComponentCalls!("DisplayFormInput", true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    // TODO Add Tests
}}