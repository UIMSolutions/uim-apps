module uim.apps.views.components.tabs.tab;

@safe:
import uim.apps;

class DAPPTabViewComponent : DAPPViewComponent {
  mixin(APPViewComponentThis!("APPTabViewComponent"));

  mixin(OProperty!("DH5Obj[]", "cards"));
  mixin(OProperty!("string", "title"));
  mixin(OProperty!("bool", "active"));
  mixin(OProperty!("DAPPPaneViewComponent", "pane"));

  DH5Obj tabNav(STRINGAA options) {
    return BS5NavLink((active ? ["active"] : null), ["href":"#"~id, "data-bs-toggle":"tab"], title);
  }

  DH5Obj tabPane(STRINGAA options) {
    return BS5TabPane(id, (active ? ["active", "show"] : null), pane.toH5(options));
  }
}
mixin(APPViewComponentCalls!("APPTabViewComponent"));