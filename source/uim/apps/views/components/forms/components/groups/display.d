module uim.apps.views.components.forms.components.groups.display;

@safe:
import uim.apps;

class DAPPFormGroupDisplay : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("APPFormGroupDisplay", true));

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
mixin(APPFormComponentCalls!("APPFormGroupDisplay", true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    // TODO Add Tests
}}