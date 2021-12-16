module uim.apps.views.components.forms.groups.name;

@safe:
import uim.apps;

class DAPPFormGroupName : DAPPTextFormGroup {
  this() { super(); 
    this
    .id("entity_name")
    .name("entity_name")
    .label("Name")
    .placeholder("Name eingeben")
    .invalidFeedback("Name ist nicht korrekt"); }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }

}
auto APPFormGroupName() { return new DAPPFormGroupName; }
auto APPFormGroupName(DAPPForm myForm) { return new DAPPFormGroupName(myForm); };
auto APPFormGroupName(DOOPEntity myEntity) { return new DAPPFormGroupName(myEntity); };
auto APPFormGroupName(DAPPForm myForm, DOOPEntity myEntity) { return new DAPPFormGroupName(myForm, myEntity); };
