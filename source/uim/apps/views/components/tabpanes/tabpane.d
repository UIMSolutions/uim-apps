module uim.apps.views.components.tabpanes.tabpane;

@safe:
import uim.apps;

class DTabPane : DViewComponent {
    mixin(ViewComponentThis!("TabPane"));

        // this.key("tab"~to!string(uniform(0, 1000))).title("Tab");

    mixin(OProperty!("bool", "disabled"));
    mixin(OProperty!("bool", "active"));
    mixin(OProperty!("string", "title"));
    mixin(OProperty!("string", "key"));
    mixin(OProperty!("string", "path"));

    mixin(OProperty!("string[]", "actions"));

    override DH5Obj[] toH5(STRINGAA options = null) { 
        super.toH5(options);
        if (hasError || "redirect" in options) { return null; }
   
        auto card = BS5Card;
        if (showHeader) card.header(this.components["header"].toH5(options));
        card(this.components["content"].toH5(options));
        if (showFooter) card.footer(this.components["footer"].toH5(options));

        return [card].toH5;
    }
}
mixin(ViewComponentCalls!("TabPane"));
