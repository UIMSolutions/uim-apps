module uim.apps.views.entities.create;

@safe:
import uim.apps;

class DAPPEntityCreateView : DAPPEntityView {
  mixin(APPViewThis!("APPEntityCreateView"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityCreateView~"::DAPPEntityCreateView:initialize");   
    super.initialize;

    this
      .pageHeader( // set page header
        APPPageHeader(this).actions(["refresh", "list"]))
      .form( // Set form 
        APPEntityForm(this)
        .crudMode(CRUDModes.Create)) 
      .form // Set form components
        .formHeader(
          APPEntityFormHeader(this.form).actions([["cancel", "save"], ["print", "export"]]))
        .formBody(
          APPEntityFormBody(this.form)
          .fields(["name", "display", "description"]) 
      );
  }
}
mixin(APPViewCalls!("APPEntityCreateView"));

unittest {
  version(test_uim_apps) {
    //
  }
}