module uim.apps.views.crud.list;

@safe:
import uim.apps;

class DAPPEntitiesListView : DAPPEntitiesView {
  mixin(APPViewThis!("APPEntitiesListView", false, true));


  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("bool", "readonly"));
  mixin(OProperty!("DAPPEntitiesListForm", "form"));

  override void initialize() {
    super.initialize;

    this
    .form(
      APPEntitiesListForm(this))
    .header(
      APPPageHeader(this).actions(["refresh", "create"]));
  }

/* 
  override void _afterSetEntities() {
    super._afterSetEntities;

    debug writeln(this.entities ? "Has %s entities".format(this.entities.length) : "No entities");
  } */

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesListView~"::DAPPEntitiesListView:toH5");    
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

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

version(test_uim_apps) {
  unittest {
    //
  }
}