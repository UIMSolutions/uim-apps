module uim.apps.views.components.forms.components.groups.name;

@safe:
import uim.apps;

class DFormGroupName : DAPPTextFormGroup {
  mixin(FormComponentThis!("FormGroupName", true));

  override void initialize() {
    super.initialize;

    this
      .id("entity_name")
      .inputName("entity_name")
      .fieldName("name")
      .label("Name")
      .placeholder("Name eingeben")
      .invalidFeedback("Name ist nicht korrekt");
  }
}
mixin(FormComponentCalls!("FormGroupName", true));
