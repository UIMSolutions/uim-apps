module uim.apps.views.crud.create;

@safe:
import uim.apps;

class DAPPEntityCreateView : DAPPEntityCRUDAPPView {
  mixin(ViewThis!("APPEntityCreateView"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__); 

    if (auto pgHeader = cast(DPageHeader)this.header) {
      pgHeader.actions([["refresh", "list"]]); }

    if (auto frm = cast(DForm)this.form) {
      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader.actions([["cancel", "save"], ["print", "export"]]); }

      if (auto frmContent = cast(DEntityFormContent)frm.content) {
        frmContent.fields(["name", "display", "description"]); }
    }

    this.crudMode(CRUDModes.Create);
  }
}
mixin(ViewCalls!("APPEntityCreateView"));

version(test_uim_apps) { unittest {
  assert(APPEntityCreateView);

  writeln("--- Tests in ", __MODULE__, "/", __LINE__);
  testView(new DAPPEntityCreateView); 

  writeln("--- Tests in ", __MODULE__, "/", __LINE__);
  testView(APPEntityCreateView); 
}}