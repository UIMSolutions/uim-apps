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
        APPEntityForm(this)
          .crudMode(CRUDModes.Update))
      .form
        .header(
          APPEntityFormHeader(this.form)
            .actions([["cancel2list", "save"], ["edit", "version", "delete"], ["print", "export"]]));
  }
}
mixin(APPViewCalls!("APPEntityUpdateView"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    //
  }
}