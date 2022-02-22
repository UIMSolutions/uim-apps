module uim.apps.views.components.forms.components.entities;

@safe:
import uim.apps;

class DAPPEntitiesFormComponent : DAPPFormComponent, IAPPWithEntities {
  mixin(APPFormComponentThis!("APPEntitiesFormComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities")); 
}
mixin(APPFormComponentCalls!("APPEntitiesFormComponent"));
