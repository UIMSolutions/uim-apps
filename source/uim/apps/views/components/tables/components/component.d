module uim.apps.views.components.tables.components.component;

@safe:
import uim.apps;

class DAPPTableComponent : DAPPViewComponent {
  mixin(APPViewComponentThis!("APPTableComponent"));

  mixin(OProperty!("DAPPTable", "table"));
}
mixin(APPViewComponentCalls!("APPTableComponent"));
