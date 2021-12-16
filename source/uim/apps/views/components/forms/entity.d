module uim.apps.views.components.forms.entity;

@safe:
import uim.apps;

class DAPPEntityForm : DAPPForm {
  this() { super(); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPView myView) { this().view(myView); }
  this(DAPPView myView, DOOPEntity myEntity) { this(myView).entity(myEntity); }
}
mixin(APPFormCalls!("APPEntityForm"));