module uim.apps.views.components.forms.components.groups.name;

@safe:
import uim.apps;

class DAPPFormGroupName : DAPPTextFormGroup {
  mixin(APPFormComponentThis!("APPFormGroupName"));
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }

  override void initialize() {
    super.initialize;

    this
    .id("entity_name")
    .name("entity_name")
    .fieldName("name")
    .label("Name")
    .placeholder("Name eingeben")
    .invalidFeedback("Name ist nicht korrekt");
  }
}
mixin(APPFormComponentCalls!("APPFormGroupName"));
auto APPFormGroupName(DOOPEntity myEntity) { return new DAPPFormGroupName(myEntity); };
auto APPFormGroupName(DAPPForm myForm, DOOPEntity myEntity) { return new DAPPFormGroupName(myForm, myEntity); };
