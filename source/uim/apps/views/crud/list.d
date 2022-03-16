module uim.apps.views.crud.list;

@safe:
import uim.apps;

class DAPPEntitiesListView : DAPPEntitiesView {
  mixin(APPViewThis!("APPEntitiesListView", false, true));

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(APPParameter!("rootPath"));
  mixin(OProperty!("bool", "readonly"));
  
  mixin(OProperty!("DAPPEntitiesForm", "form"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntitiesListView~"::DAPPEntitiesListView("~this.name~"):in");    
    super.initialize;

    this
      .form(
        APPEntitiesListForm(this))
      .header(
        APPPageHeader(this).actions(["refresh", "create"])); 
  }

/*   override void _afterSetEntities() {
    super._afterSetEntities;

    if (auto entitiesForm = cast(DAPPEntitiesForm)this.form) {
      entitiesForm.entities(this.entities);
    }
  } */

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesListView~"::DAPPEntitiesListView("~this.name~"):toH5");    
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    return [
      H5Div(["container-xl"],
        (this.header ? this.header.toH5(options) : null)~ 
        (this.messages ? BS5Row("messages", ["mb-2"]) : null)~
        BS5Row(["row-deck row-cards mb-2"], this.form ? form.toH5(options) : null)~
        (this.footer ? this.footer.toH5(options) : null)
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