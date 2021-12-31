module uim.apps.views.components.forms.components.groups.display;

@safe:
import uim.apps;

class DAPPFormGroupDisplay : DAPPTextFormGroup {
  this() { super(); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this(myForm).entity(myEntity); }

  override void initialize() {
    super.initialize();

    this
    .id("entity_display")
    .name("entity_display")
    .fieldName("display")
    .label("Titel")
    .placeholder("Titel eingeben")
    .invalidFeedback("Titel ist nicht korrekt"); 
  }
}
auto APPFormGroupDisplay() { return new DAPPFormGroupDisplay; }
auto APPFormGroupDisplay(DAPPForm myForm) { return new DAPPFormGroupDisplay(myForm); };
auto APPFormGroupDisplay(DOOPEntity myEntity) { return new DAPPFormGroupDisplay(myEntity); };
auto APPFormGroupDisplay(DAPPForm myForm, DOOPEntity myEntity) { return new DAPPFormGroupDisplay(myForm, myEntity); };


unittest {
  version(uim_apps) {
    // TODO Add Tests
}}