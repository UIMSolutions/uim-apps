module uim.apps.views.crud.entity;

@safe:
import uim.apps;

class DAPPEntityCRUDView : DAPPView {
  mixin(APPViewThis!("APPEntityCRUDView"));

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("bool", "readonly"));

  mixin(APPParameter!("rootPath"));
  mixin(APPViewProperty!("DForm", "form"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityCRUDView~"::DAPPEntityCRUDView("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  
    this
      .crudMode(
        CRUDModes.Read)
      .header(
        APPPageHeader(this).actions(["refresh", "list", "create"]))
      .form(
        EntityForm(this).crudMode(CRUDModes.Read));

    if (auto form = this.form) {
      form.components["header"] = EntityFormHeader(this.form).actions([["edit", "version", "delete"], ["print", "export"]]);    
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityCRUDView~"::DAPPEntityCRUDView("~this.name~"):beforeH5");    
    super.beforeH5(options);
    debug writeln(entity ? "Has entity" : "no entity");
    if (hasError || "redirect" in options) { return; }

    if (auto entityForm = cast(DEntityForm)this.form) {
      debug writeln("Found entityForm");
      entityForm.entity(this.entity);
    } else debug writeln("No entityForm"); 
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityCRUDView~"::DAPPEntityCRUDView("~this.name~"):toH5");    
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    debug writeln(entity ? "Has entity" : "no entity");

    auto panes = 
      BS5Card(
        H5Ul(["nav nav-tabs"], ["data-bs-toggle":"tabs"],
          H5Li(["nav-item"], 
            H5A(["nav-link active"], ["href":"#tabs-general", "data-bs-toggle":"tab"], "Allgemein")),
          H5Li(["nav-item"], 
            H5A(["nav-link"], ["href":"#tabs-versions", "data-bs-toggle":"tab"], "Versionen")),
          H5Li(["nav-item dropdown"], 
            H5A(["nav-link dropdown-toggle"], ["data-bs-toggle":"dropdown", "role":"button", "aria-haspopup":"true", "aria-expanded":"false"], "Mehr..."),
            H5Div("dropdown-menu", ["style":""], 
              H5A(["dropdown-item"], ["href":"#"], "Berechtigungen")))))
        .body_(
          H5Div(["tab-content"], 
            H5Div("tabs-general", ["tab-pane active show"],
              H5Div(
                "Cursus turpis vestibulum, dui in pharetra vulputate id sed non turpis ultricies fringilla at sed facilisis lacus pellentesque purus nibh")),
            H5Div("tabs-versions", ["tab-pane"],
              H5Div(
                "that the coronavirus infects cells in the pancreas that make insulin, a hormone that lowers blood sugar levels by signaling cells to take in sugar and burn it"))));

    return [
      H5Div(["container-xl"],
        (this.header ? this.header.toH5(options) : null)~ 
        (this.components["messages"].notNull ? BS5Row("messages", ["mb-2"], this.components["messages"].toH5(options)) : null)~
        BS5Row(["row-deck row-cards mb-2"], form.toH5(options))~
        BS5Row(["row-deck row-cards mb-2"], panes)~
        (this.footer ? this.footer.toH5(options) : null)
      )].toH5;             
  }
}
mixin(APPViewCalls!("APPEntityCRUDView"));

version(test_uim_apps) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityCRUDView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityCRUDView); 
}}