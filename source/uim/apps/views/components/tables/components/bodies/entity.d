module uim.apps.views.components.tables.components.bodies.entity;

@safe:
import uim.apps;

class DAPPEntityTableBody : DAPPTableBody, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPEntityTableBody"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPViewComponentCalls!("APPEntityTableBody"));
