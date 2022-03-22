module uim.apps.views.crud.delete_;

@safe:
import uim.apps;

class DAPPEntityDeleteView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityDeleteView"));

  override void initialize() {
    super.initialize;

    this
      .crudMode(CRUDModes.Delete)
      .header(
        APPPageHeader(this).actions(["refresh", "list", "create"]));

    auto form = Form(this).crudMode(CRUDModes.Delete);
    this.components["form"] = form;
    form.components["header"] = FormHeader(form).actions([["cancel2root", "finalDelete"], ["view", "version", "edit"], ["print", "export"]]);
  }
}
mixin(APPViewCalls!("APPEntityDeleteView"));

version(test_uim_apps) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityDeleteView); 
}}