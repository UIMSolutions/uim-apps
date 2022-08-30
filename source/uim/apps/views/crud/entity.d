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
  mixin(OProperty!("DUIMTabControl", "entityTab"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityCRUDView~"::DAPPEntityCRUDView("~this.name~"):initialize");   
    super.initialize;

    this
      .header(
        PageHeader(this)
          .actions([["refresh", "list", "create"]]))
      .entityTab(
        UIMTab
          .panes([
            UIMTabPane
              .title("Allgemein")
              .content(
                H5Div("This is a primary pane")
              ),
            UIMTabPane
              .title("Beschreibungen")
              .content(
                H5Div("This is a secondary pane")
              ),
            UIMTabPane
              .title("Versionen")
              .content(
                H5Div("This is a third pane")
              )                        
          ])
      )
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
    
    return [
      H5Div(["container-xl"],
        (this.header ? this.header.toH5(options) : null)~ 
        (this.components["messages"].notNull ? BS5Row("messages", ["mb-2"], this.components["messages"].toH5(options)) : null)~
        BS5Row(["row-deck row-cards mb-2"], form.toH5(options))~
        BS5Row(["row-deck row-cards mb-2"], H5Div(["col-12"], entityTab))~
        (this.footer ? this.footer.toH5(options) : null)
      )].toH5;             
  }
}
mixin(APPViewCalls!("APPEntityCRUDView"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityCRUDView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityCRUDView); 
}}