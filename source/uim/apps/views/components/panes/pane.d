module uim.apps.views.components.panes.pane;

@safe:
import uim.apps;

class DAPPPane : DAPPViewComponent {
    this() { super();
        this.key("tab"~to!string(uniform(0, 1000))).title("Tab");
    }

    mixin(SProperty!("bool", "disabled"));
    mixin(SProperty!("bool", "active"));
    mixin(SProperty!("string", "title"));
    mixin(SProperty!("string", "key"));
    mixin(SProperty!("string", "path"));
    mixin(SProperty!("string[]", "actions"));
    mixin(SProperty!("DOOPEntity", "entity"));

    void inner(STRINGAA options = null) {
        //
    }

    DH5Obj _col; 
    override void beforeH5(STRINGAA options = null) { // hook
        super.beforeH5(options);
        if (hasError) { return; }
   
        
        _col = BS5Col(["col-12"]);
        inner(options);

        _h5Content ~= BS5CardBody(
            H5Div(["card-title"], this.title),
            BS5Row(_col));
    }
}
auto APPPane() { return new DAPPPane; }
auto APPPane(DOOPEntity entity) { return APPPane.entity(entity); }
auto APPPane(string myKey, string myTitle) { return APPPane.key(myKey).title(myTitle); }
auto APPPane(string myKey, string myTitle, string myPath) { return APPPane.key(myKey).title(myTitle).path(myPath); }
auto APPPane(DOOPEntity entity, string myKey, string myTitle, string myPath) { return APPPane(entity).key(myKey).title(myTitle).path(myPath); }
