module uim.apps.views.crud.list;

@safe:
import uim.apps;

class DAPPEntitiesListView : DAPPView {
  mixin(APPViewThis!("APPEntitiesListView", false, true));

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(APPParameter!("rootPath"));
  mixin(OProperty!("bool", "readonly"));
  
  override void initialize() {
    debugMethodCall(moduleName!DAPPEntitiesListView~"::DAPPEntitiesListView("~this.name~"):in");    
    super.initialize;

    this.components["header"] = APPPageHeader(this).actions(["refresh", "create"]);
    this.components["form"] = APPEntitiesListForm(this);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesListView~"::DAPPEntitiesListView("~this.name~"):toH5");    
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    return [
      H5Div(["container-xl"],
        this.components["header"].toH5(options)~ 
        BS5Row("messages", ["mb-2"], this.components["messages"].toH5(options))~
        BS5Row(["row-deck row-cards mb-2"], this.components["form"].toH5(options))~
        this.components["footer"].toH5(options)
      )].toH5;             
  }
}
mixin(APPViewCalls!("APPEntitiesListView"));

version(test_uim_apps) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntitiesListView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntitiesListView); 
}}