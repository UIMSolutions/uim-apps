module uim.apps.views.entities.update;

@safe:
import uim.apps;

class DAPPEntityUpdateView : DAPPEntityView {
  mixin(APPViewThis!("APPEntityUpdateView"));

  override void initialize() {
    super.initialize;

    this
      .pageHeader(
        APPPageHeader(this) 
          .actions(["refresh", "list", "create"]))
      .form(
        APPEntityForm(this)
          .crudMode(CRUDModes.Update))
      .form
        .formHeader(
            APPEntityFormHeader(this.form)
              .actions([["cancel2list", "save"], ["edit", "version", "delete"], ["print", "export"]])
      );
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityUpdateView~"::DAPPEntityUpdateView:beforeH5");    
    super.beforeH5(options);    
  }
}
mixin(APPViewCalls!("APPEntityUpdateView"));

unittest {
  version(test_uim_apps) {
    //
  }
}