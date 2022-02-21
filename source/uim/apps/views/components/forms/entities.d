module uim.apps.views.components.forms.entities;

@safe:
import uim.apps;

class DAPPEntitiesForm : DAPPForm, IAPPWithEntities {
  mixin(APPFormThis!("APPEntitiesForm"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(APPFormCalls!("APPEntitiesForm"));
