module uim.apps.views.components.forms.components.entity;

@safe:
import uim.apps;

class DAPPEntityFormComponent : DAPPFormComponent, IAPPWithEntity {
  mixin(APPFormComponentThis!("APPEntityFormComponent"));

  mixin(OProperty!("DOOPEntity", "entity")); 
}
mixin(APPFormComponentCalls!("APPEntityFormComponent"));
