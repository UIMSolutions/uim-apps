module uim.apps.views.components.forms.form;

@safe:
import uim.apps;

class DForm : DViewComponent {
  mixin(FormThis!("Form"));

  override void initialize() {
    debugMethodCall(moduleName!DForm~"::DForm("~this.name~"):initialize");   
    super.initialize;    
    writeln("In ", __MODULE__, "/", __LINE__);
 
    this
      .id("form_"~to!string(viewComponentCounter))
      .header(
        FormHeader(this))
      .content(
        EntityFormContent(this))
      .crudMode(CRUDModes.Read)
      .method("post");
  
  }

  mixin(OProperty!("string[string]", "defaults"));
  mixin(OProperty!("string[]", "fields"));
  mixin(OProperty!("DAPPPanes", "panes"));
  mixin(APPParameter!("action"));

  mixin(APPParameter!("method"));
  mixin(OProperty!("bool", "readonly"));

  mixin(OProperty!("CRUDModes", "crudMode", "CRUDModes.Read", true, true, "", `
    foreach(component; this.components.all) {
      if (auto frmComp = cast(DFormComponent)component) {
        frmComp.crudMode(this.crudMode); }} `));

  mixin(APPParameter!("entityName"));
  mixin(APPParameter!("entitiesName"));
  mixin(APPParameter!("headerTitle"));
  mixin(APPParameter!("contentTitle"));
  mixin(APPParameter!("footerTitle"));

  mixin(OViewComponent!("header"));
  mixin(OViewComponent!("content"));
  mixin(OViewComponent!("footer"));

  DETBBase _database; 
  O database(this O)(DETBBase aDatabase) { 
    _database = aDatabase; 
    return cast(O)this; }

  DETBBase database() {
    if (_database) { return _database; } // has his own database
    if (this.view && this.view.database) { return this.view.database; } // owner class has database
    return null; // no database found
  }

/*   override DViewComponent copy() {
    return
      (cast(DForm)copy)
        .crudMode(this.crudMode)
        .header(this.header)
        .content(this.content)
        .footer(this.footer)
        .rootPath(this.rootPath)
        .defaults(this.defaults)
        .fields(this.fields)
        .panes(this.panes)
        .action(this.action)
        .method(this.method)
        .readonly(this.readonly)
        .entityName(this.entityName)
        .entitiesName(this.entitiesName)
        .headerTitle(this.headerTitle)
        .contentTitle(this.contentTitle)
        .footerTitle(this.footerTitle);
  }  */

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DForm~":DForm("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    foreach(viewComponent; components.all) {
      if (auto formComponent = cast(DFormComponent)viewComponent) {
        formComponent
          .crudMode(this.crudMode)
          .rootPath(this.rootPath);
      }
    }

    if (auto frmHeader = cast(DFormHeader)this.header) {
      frmHeader
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .title(headerTitle);
    }

    if (auto frmContent = cast(DEntityFormContent)this.components["content"]) { 
      frmContent
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .title(contentTitle);
    }
    
    if (auto frmFooter = cast(DFormFooter)this.components["footer"]) {
      frmFooter
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .title(footerTitle);
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DForm~":DForm("~this.name~")::toH5");
    super.toH5(options);
    
    DBS5Col _col = BS5Col(["col-12"]);
    _col(
      H5Form(this.id, ["card"], ["method":method, "action":action], 
        this.header.toH5(options)~
        this.content.toH5(options)~
        this.footer.toH5(options)
      ));
    
    return [_col].toH5;
  }  
}
mixin(FormCalls!("Form"));
