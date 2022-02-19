module uim.apps.views.entities.list;

@safe:
import uim.apps;

class DAPPEntitiesListView : DAPPView, IAPPWithEntities {
  mixin(APPViewThis!("APPEntitiesListView", false, true));

  override void initialize() {
    super.initialize;

    this
    .form(
      APPEntitiesListForm(this))
    .header(
      APPPageHeader(this).actions(["refresh", "create"]));
  }

  mixin(OProperty!("DOOPEntity[]", "entities"));

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("bool", "readonly"));
  mixin(OProperty!("DAPPEntitiesListForm", "form"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesListView~"::DAPPEntitiesListView:beforeH5");   
    super.beforeH5(options);    
  
    if (auto entitiesController = cast(IAPPWithEntities)this.controller) { // Should be the right controller
      debug writeln("Found entities in controller: ", entitiesController.entities.length);
      this.entities(entitiesController.entities); 
    }
    debug writeln(this.entities ? "Has %s entities".format(this.entities.length) : "No entities");
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesListView~"::DAPPEntitiesListView:toH5");    
    super.toH5(options);

    return [
      H5Div(["container-xl"],
        (this.header ? this.header.toH5(options) : null)~ 
        (messages ? BS5Row("messages", ["mb-2"]) : null)~
        BS5Row(["row-deck row-cards mb-2"], form.toH5(options))~
        (this.footer ? this.footer.toH5(options) : null)
      )].toH5;             
  }
}
mixin(APPViewCalls!("APPEntitiesListView"));

unittest {
  version(test_uim_apps) {
    //
  }
}