module uim.apps.views.crud.create;

@safe:
import uim.apps;

class DAPPEntityCreateView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityCreateView"));

  override void initialize() {
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__); 

    this
      .header(
        PageHeader(this)
          .actions([["refresh", "list"]]))
      .form(
        Form(this)
          .crudMode(CRUDModes.Create)
          .header(
            FormHeader
              .actions([["cancel", "save"], ["print", "export"]]))
          .content(
            EntityFormContent
              .fields(["name", "display", "description"])));
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