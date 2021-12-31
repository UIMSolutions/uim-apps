module uim.apps.views.components.panes.pane;

@safe:
import uim.apps;

class DAPPPane : DAPPViewComponent, IAPPWithEntity {
    this() { super();
        this.key("tab"~to!string(uniform(0, 1000))).title("Tab");
    }

    mixin(OProperty!("bool", "disabled"));
    mixin(OProperty!("bool", "active"));
    mixin(OProperty!("string", "title"));
    mixin(OProperty!("string", "key"));
    mixin(OProperty!("string", "path"));
    mixin(OProperty!("string[]", "actions"));
    mixin(OProperty!("DOOPEntity", "entity"));

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
auto APPPane() { return new DAPPPane; }
auto APPPane(DOOPEntity entity) { return APPPane.entity(entity); }
auto APPPane(string myKey, string myTitle) { return APPPane.key(myKey).title(myTitle); }
auto APPPane(string myKey, string myTitle, string myPath) { return APPPane.key(myKey).title(myTitle).path(myPath); }
auto APPPane(DOOPEntity entity, string myKey, string myTitle, string myPath) { return APPPane(entity).key(myKey).title(myTitle).path(myPath); }
