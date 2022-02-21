module uim.apps.views.crud.read;

@safe:
import uim.apps;

class DAPPEntityReadView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityReadView"));

  override void initialize() {
    super.initialize;

    this
      .header(
        APPPageHeader(this).actions(["refresh", "list", "create"]));

    this
      .form(
        APPEntityForm(this))
      .form
        .header(
          APPEntityFormHeader(this.form).actions([["edit", "version", "delete"], ["print", "export"]]));
    
    this      
      .form
        .crudMode(CRUDModes.Read);
  }
}
mixin(APPViewCalls!("APPEntityReadView"));

version(test_uim_apps) {
  unittest {
    //
}}