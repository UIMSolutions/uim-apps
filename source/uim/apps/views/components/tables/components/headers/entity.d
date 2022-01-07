module uim.apps.views.components.tables.components.headers.entity;

@safe:
import uim.apps;

class DAPPEntityTableHeader : DAPPTableHeader, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPEntityTableHeader"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPViewComponentCalls!("APPEntityTableHeader"));
