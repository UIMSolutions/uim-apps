module uim.apps.views.components.panes.pane;

@safe:
import uim.apps;

class DAPPPaneViewComponent : DAPPViewComponent {
    mixin(APPViewComponentThis!("APPPaneViewComponent"));

        // this.key("tab"~to!string(uniform(0, 1000))).title("Tab");

    mixin(OProperty!("bool", "disabled"));
    mixin(OProperty!("bool", "active"));
    mixin(OProperty!("string", "title"));
    mixin(OProperty!("string", "key"));
    mixin(OProperty!("string", "path"));
    mixin(OProperty!("string[]", "actions"));

    void inner(STRINGAA options = null) {
        //
    }

    DH5Obj _col;
    override DH5Obj[] toH5(STRINGAA options = null) { // hook
        super.toH5(options);
        if (hasError) { return null; }
   
        
        _col = BS5Col(["col-12"]);
        inner(options);

        return [
            BS5CardBody(
            H5Div(["card-title"], this.title),
            BS5Row(_col))].toH5;
    }
}
mixin(APPViewComponentCalls!("APPPaneViewComponent"));
