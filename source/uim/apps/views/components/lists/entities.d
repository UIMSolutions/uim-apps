module uim.apps.views.components.lists.entities;

@safe:
import uim.apps;

class DAPPEntitiesList : DAPPListViewComponent/* , IAPPWithEntities */ {
  mixin(APPViewComponentThis!("APPEntitiesList"));

//  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(APPViewComponentCalls!("APPEntitiesList"));