module uim.apps.views.components.forms.components.inputs.name;

@safe:
import uim.apps;

class DNameFormInput : DTextFormInput {
  mixin(ViewComponentThis!("NameFormInput", true));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
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
mixin(ViewComponentCalls!("NameFormInput", true));
