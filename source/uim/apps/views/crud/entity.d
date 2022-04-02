module uim.apps.views.crud.entity;

@safe:
import uim.apps;

class DAPPEntityCRUDView : DAPPView {
  mixin(APPViewThis!("APPEntityCRUDView"));

  mixin(OProperty!("CRUDModes", "crudMode", null, true, true, "", `
    foreach(component; this.components.all) {
      if (auto frm = cast(DForm)component) {
        frm.crudMode(this.crudMode); }} `));

  mixin(OProperty!("bool", "readonly", "CRUDModes.Read", true, true, "", `
    foreach(component; this.components.all) {
      if (auto frm = cast(DForm)component) {
        frm.readonly(this.readonly); }}`));

  mixin(APPParameter!("rootPath", `
    foreach(component; this.components.all) {
      if (auto pgHeader = cast(DPageHeader)component) {
        pgHeader.rootPath(this.rootPath); }
      if (auto frm = cast(DForm)component) {
        frm.rootPath(this.rootPath); }
    }`));

  mixin(OViewComponent!("form"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityCRUDView~"::DAPPEntityCRUDView("~this.name~"):initialize");   
    super.initialize;

    this
      .header(
        PageHeader(this)
          .actions([["refresh", "list", "create"]]))
      .form(
        Form(this)
          .header(
            FormHeader
              .actions([["edit", "version", "delete"], ["print", "export"]]))
          .content(
            EntityFormContent))    
      .crudMode(CRUDModes.Read);
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityCRUDView~"::DAPPEntityCRUDView("~this.name~"):beforeH5");    
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln(this.entity ? "Has entity "~this.entity.name : "ENtity missing");
    if (auto frm = cast(DForm)this.form) {
      debug writeln("Found DForm");
      frm.entity(this.entity);
    } 
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityCRUDView~"::DAPPEntityCRUDView("~this.name~"):toH5");    
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

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