module uim.apps.views.crud.create;

@safe:
import uim.apps;

class DAPPEntityCreateView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityCreateView"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityCreateView~"::DAPPEntityCreateView:initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__); 

    this.components["header"] = APPPageHeader(this).actions(["refresh", "list"]);

    auto form = EntityForm(this).crudMode(CRUDModes.Create);
    this.components["form"] = form;
    form.components["header"] = EntityFormHeader(form).actions([["cancel", "save"], ["print", "export"]]);
    form.components["content"] = EntityFormContent(form).fields(["name", "display", "description"]);
  }
}
mixin(APPViewCalls!("APPEntityCreateView"));

version(test_uim_apps) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityCreateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityCreateView); 
}}