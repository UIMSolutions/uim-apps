module uim.apps.views.crud.entity;

@safe:
import uim.apps;

class DAPPEntityCRUDView : DAPPEntityView {
  mixin(APPViewThis!("APPEntityCRUDView"));

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("bool", "readonly"));
  mixin(OProperty!("DAPPEntityForm", "form"));

  override void initialize() {
    super.initialize;

    this
      .crudMode(CRUDModes.Read)
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

  override void _afterSetEntity() {
    super._afterSetEntity;

    if (auto entityForm = cast(DAPPEntityForm)this.form) {
      debug writeln("Found entityView");
      entityForm.entity(this.entity);
    } 
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityView~"::DAPPEntityView:toH5");    
    super.toH5(options);

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
        (messages ? BS5Row("messages", ["mb-2"]) : null)~
        BS5Row(["row-deck row-cards mb-2"], form.toH5(options))~
        BS5Row(["row-deck row-cards mb-2"], panes)~
        (this.footer ? this.footer.toH5(options) : null)
      )].toH5;             
  }
}
mixin(APPViewCalls!("APPEntityCRUDView"));

version(test_uim_apps) {
  unittest {
    //
}}