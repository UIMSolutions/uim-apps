module uim.apps.views.components.forms.form;

@safe:
import uim.apps;

class DAPPForm : DViewComponent {
  mixin(APPFormThis!("APPForm"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPForm~"::DAPPForm("~this.name~"):initialize");   
    super.initialize;
    writeln("In ", __MODULE__, "/", __LINE__);
 
    this
      .crudMode(CRUDModes.Read)
      .header(APPFormHeader)
      .content(APPFormContent)
      .method("post");
  }

  mixin(OProperty!("string[string]", "defaults"));
  mixin(OProperty!("string[]", "fields"));
  mixin(OProperty!("DAPPPanes", "panes"));
  mixin(APPParameter!("action"));
  mixin(APPParameter!("rootPath"));
  mixin(APPParameter!("method"));
  mixin(OProperty!("bool", "readonly"));
  mixin(OProperty!("CRUDModes", "crudMode"));  
  mixin(APPParameter!("entityName"));
  mixin(APPParameter!("entitiesName"));
  mixin(APPParameter!("headerTitle"));
  mixin(APPParameter!("contentTitle"));
  mixin(APPParameter!("footerTitle"));

/*   mixin(APPViewProperty!("DAPPFormHeader", "header"));
  mixin(APPViewProperty!("DAPPFormContent", "content"));
  mixin(APPViewProperty!("DFormFooter", "footer")); */

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
      (cast(DAPPForm)copy)
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
    debugMethodCall(moduleName!DAPPForm~":DAPPForm("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    foreach(viewComponent; components) {
      if (auto formComponent = cast(DAPPFormComponent)viewComponent) {
        formComponent
          .crudMode(this.crudMode)
          .rootPath(this.rootPath);
      }
    }

    if (auto formHeader = cast(DAPPFormHeader)this.header) {
      formHeader
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .title(headerTitle);
    }

    if (auto formContent = cast(DAPPFormContent)this.content) { 
      formContent
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .title(contentTitle);
    }
    
    if (auto formFooter = cast(DFormFooter)this.footer) {
      formFooter
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .title(footerTitle);
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPForm~":DAPPForm("~this.name~")::toH5");
    super.toH5(options);
    
    DBS5Col _col = BS5Col(["col-12"]);
    _col(
      H5Form("entityForm", ["card"], ["method":method, "action":action], 
        (header ? header.toH5(options) : null)~
        (content ? content.toH5(options) : null)~
        (footer ? footer.toH5(options) : null)
      ));
    
    return [_col].toH5;
  }  
}
mixin(APPFormCalls!("APPForm"));
