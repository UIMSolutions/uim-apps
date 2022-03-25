module uim.apps.views.crud.update;

@safe:
import uim.apps;

class DAPPEntityUpdateView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityUpdateView"));

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
            .actions([["cancel2list", "save"], ["edit", "version", "delete"], ["print", "export"]]));
    }
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