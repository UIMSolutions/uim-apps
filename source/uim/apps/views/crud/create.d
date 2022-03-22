module uim.apps.views.crud.create;

@safe:
import uim.apps;

class DAPPEntityCreateView : DAPPEntityCRUDView {
  mixin(APPViewThis!("APPEntityCreateView"));

  override void initialize() {
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__); 

    this
      .header(
        PageHeader(this).actions([["refresh", "list"]]));

    auto form = Form(this).crudMode(CRUDModes.Create);
    this.form(form);
    form
      .header(
        FormHeader(form).actions([["cancel", "save"], ["print", "export"]]))
      .content(
        FormContent(form));//.fields(["name", "display", "description"]));
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