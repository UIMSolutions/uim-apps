module uim.apps.views.components.tables.components.headers.entity;

@safe:
import uim.apps;

class DAPPEntityTableHeader : DAPPTableHeader, IAPPWithEntity {
  mixin(ViewComponentThis!("APPEntityTableHeader"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(ViewComponentCalls!("APPEntityTableHeader"));
