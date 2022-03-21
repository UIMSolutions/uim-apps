module uim.apps.views.crud.read;

@safe:
import uim.apps;

class DAPPEntityReadView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityReadView"));

  override void initialize() {
    super.initialize;

    this.components["header"] = APPPageHeader(this).actions(["refresh", "list", "create"]);

    auto form = this.components["form"];
    form.components["header"] = EntityFormHeader(this.form).actions([["edit", "version", "delete"], ["print", "export"]]);
  }
}
mixin(APPViewCalls!("APPEntityReadView"));

version(test_uim_apps) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityReadView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityReadView); 
}}