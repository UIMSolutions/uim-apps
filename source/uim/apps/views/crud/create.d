module uim.apps.views.crud.create;

@safe:
import uim.apps;

class DAPPEntityCreateView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityCreateView"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityCreateView~"::DAPPEntityCreateView:initialize");   
    super.initialize;

    this
      .header( // set page header
        APPPageHeader(this).actions(["refresh", "list"]))
      .form( // Set form 
        APPEntityForm(this)
        .crudMode(CRUDModes.Create)) 
      .form // Set form components
        .header(
          APPEntityFormHeader(this.form).actions([["cancel", "save"], ["print", "export"]]))
        .body_(
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