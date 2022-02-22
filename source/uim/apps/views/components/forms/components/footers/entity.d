module uim.apps.views.components.forms.components.footers.entity;

@safe:
import uim.apps;

class DAPPEntityFormFooter : DAPPFormFooter, IAPPWithEntity {
  mixin(APPFormComponentThis!("APPEntityFormFooter", true));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPFormComponentCalls!("APPEntityFormFooter", true));

