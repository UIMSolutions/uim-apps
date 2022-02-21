module uim.apps.views.components.forms.entity;

@safe:
import uim.apps;

class DAPPEntityForm : DAPPForm, IAPPWithEntity {
  mixin(APPFormThis!("APPEntityForm"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPFormCalls!("APPEntityForm"));
