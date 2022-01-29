module uim.apps.views.components.forms.components.groups.display;

@safe:
import uim.apps;

class DAPPFormGroupDisplay : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("APPFormGroupDisplay", true));

  override void initialize() {
    super.initialize();

    this
    .id("entity_display")
    .formName("entity_display")
    .fieldName("display")
    .label("Titel")
    .placeholder("Titel eingeben")
    .invalidFeedback("Titel ist nicht korrekt"); 
  }
}
mixin(APPFormComponentCalls!("APPFormGroupDisplay", true));


unittest {
  version(test_uim_apps) {
    // TODO Add Tests
}}