module uim.apps.views.components.tables.components.component;

@safe:
import uim.apps;

class DAPPTableComponent : DEntitiesViewComponent {
  mixin(ViewComponentThis!("APPTableComponent"));

  mixin(OProperty!("DAPPTableViewComponent", "table"));
}
mixin(ViewComponentCalls!("APPTableComponent"));
