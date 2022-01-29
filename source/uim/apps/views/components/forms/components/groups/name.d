module uim.apps.views.components.forms.components.groups.name;

@safe:
import uim.apps;

class DAPPFormGroupName : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("APPFormGroupName", true));

  override void initialize() {
    super.initialize;

    this
      .id("entity_name")
      .formName("entity_name")
      .fieldName("name")
      .label("Name")
      .placeholder("Name eingeben")
      .invalidFeedback("Name ist nicht korrekt");
  }
}
mixin(APPFormComponentCalls!("APPFormGroupName", true));
