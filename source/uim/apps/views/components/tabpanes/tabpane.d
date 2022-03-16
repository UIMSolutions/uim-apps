module uim.apps.views.components.tabpanes.tabpane;

@safe:
import uim.apps;

class DTabpane : DViewComponent {
    mixin(ViewComponentThis!("Tabpane"));

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
        if (showHeader) card.header(this.header ? this.header.toH5 : null);
        card(this.content ? this.content.toH5 : null);
        if (showFooter) card.footer(this.footer ? this.footer.toH5 : null);

        return [card].toH5;
    }
}
mixin(ViewComponentCalls!("Tabpane"));
