module uim.apps.views.components.tabpanes.tabpane;

@safe:
import uim.apps;

class DTabPane : DAPPViewComponent {
  mixin(ViewComponentThis!("TabPane"));

  // this.key("tab"~to!string(uniform(0, 1000))).title("Tab");

  mixin(OProperty!("bool", "disabled"));
  mixin(OProperty!("bool", "active"));
  mixin(OProperty!("string", "title"));
  mixin(OProperty!("string", "key"));
  mixin(OProperty!("string", "path"));

  mixin(OProperty!("string[]", "actions"));

  mixin(OProperty!("DAPPViewComponent", "header"));
  mixin(OProperty!("DAPPViewComponent", "content"));
  mixin(OProperty!("DAPPViewComponent", "footer"));

  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    auto card = BS5Card;
    if (showHeader) card.header(
        this.header.toH5(options));

    card(this.content.toH5(options));

    if (showFooter) card.footer(
        this.footer.toH5(options));

    return [card].toH5;
  }
}
mixin(ViewComponentCalls!("TabPane"));
