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
        APPPageHeader(this).actions(["refresh", "list", "create"]))
      .form(
        APPEntityForm(this)
          .crudMode(CRUDModes.Delete))
      .form
        .header(
          APPEntityFormHeader(this.form)
            .actions([["cancel2root", "finalDelete"], ["view", "version", "edit"], ["print", "export"]]));
  }
}
mixin(APPViewCalls!("APPEntityDeleteView"));

unittest {
  version(test_uim_apps) {
    //
  }
}