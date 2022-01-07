module uim.apps.views.components.tables.components.footers.entity;

@safe:
import uim.apps;

class DAPPEntityTableFooter : DAPPTableFooter, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPEntityTableFooter"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPViewComponentCalls!("APPEntityTableFooter"));
