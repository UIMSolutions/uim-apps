module uim.apps.views.crud.read;

@safe:
import uim.apps;

class DAPPEntityReadView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityReadView"));

  override void initialize() {
    super.initialize;

    this
      .header(
        PageHeader(this)
          .actions([["refresh", "list", "create"]]));

    if (auto frm = cast(DForm)this.form) {
      frm
        .header(
          FormHeader
            .actions([["edit", "version", "delete"], ["print", "export"]]));
    }
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