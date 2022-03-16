module uim.apps.views.components.tables.components.bodies.entities;

@safe:
import uim.apps;

class DAPPEntitiesTableBody : DAPPTableBody, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesTableBody"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(ViewComponentCalls!("APPEntitiesTableBody"));
