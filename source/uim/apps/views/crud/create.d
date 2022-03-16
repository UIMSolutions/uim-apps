module uim.apps.views.crud.create;

@safe:
import uim.apps;

class DAPPEntityCreateView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityCreateView"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityCreateView~"::DAPPEntityCreateView:initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__); 

    this
      .header( // set page header
        APPPageHeader(this).actions(["refresh", "list"]))
      .form( // Set form 
        EntityForm(this)
        .crudMode(CRUDModes.Create)) 
      .form // Set form components
        .header(
          EntityFormHeader(this.form).actions([["cancel", "save"], ["print", "export"]]))
        .content(
          EntityFormContent(this.form)
          .fields(["name", "display", "description"]) 
      );
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