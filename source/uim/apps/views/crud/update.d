module uim.apps.views.crud.update;

@safe:
import uim.apps;

class DAPPEntityUpdateView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .header(
        APPPageHeader(this)
          .actions(["refresh", "list", "create"]))
      .form(
        Form(this)
          .crudMode(CRUDModes.Update)
          .header(
            FormHeader
              .actions([["cancel2list", "save"], ["edit", "version", "delete"], ["print", "export"]])));
  }
}
mixin(APPViewCalls!("APPEntityUpdateView"));

version(test_uim_apps) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityUpdateView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityUpdateView); 
}}