module uim.apps.views.components.forms.groups.description;

@safe:
import uim.apps;

class DAPPDescriptionFormGroup : DAPPTextAreaFormGroup {
  this() { super(); 
    this
    .id("entity_description")
    .name("entity_description")
    .fieldName("description")
    .label("Beschreibung")
    .placeholder("Beschreibung eingeben"); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }

}
auto APPDescriptionFormGroup() { return new DAPPDescriptionFormGroup; }
auto APPDescriptionFormGroup(DAPPForm myForm) { return new DAPPDescriptionFormGroup(myForm); };
auto APPDescriptionFormGroup(DOOPEntity myEntity) { return new DAPPDescriptionFormGroup(myEntity); };
auto APPDescriptionFormGroup(DAPPForm myForm, DOOPEntity myEntity) { return new DAPPDescriptionFormGroup(myForm, myEntity); };


unittest {
  version(uim_apps) {
    // TODO Add Tests
}}