module uim.apps.views.components.forms.form;

@safe:
import uim.apps;

class DAPPForm : DAPPViewComponent {
  mixin(APPFormThis!("APPForm"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPForm~"::DAPPForm("~this.name~"):initialize");   
    super.initialize;
    writeln("In ", __MODULE__, "/", __LINE__);
 

    this
      .crudMode(CRUDModes.Read)
      .header(APPFormHeader)
      .body_(APPFormBody)
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
  mixin(APPParameter!("bodyTitle"));
  mixin(APPParameter!("footerTitle"));

  mixin(APPViewProperty!("DAPPFormHeader", "header"));
  mixin(APPViewProperty!("DAPPFormBody", "body_"));
  mixin(APPViewProperty!("DAPPFormFooter", "footer"));

/*   override DAPPViewComponent copy() {
    return
      (cast(DAPPForm)copy)
        .crudMode(this.crudMode)
        .header(this.header)
        .body_(this.body_)
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
        .bodyTitle(this.bodyTitle)
        .footerTitle(this.footerTitle);
  }  */

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPForm~":DAPPForm("~this.name~")::beforeH5");
    super.beforeH5(options);

    foreach(viewComponent; components) {
      if (auto formComponent = cast(DAPPFormComponent)viewComponent) {
        formComponent
          .crudMode(this.crudMode)
          .rootPath(this.rootPath);
      }
    }

    if (header) {
      debug writeln("Has header");
      header["title"] = headerTitle; 
    }

    if (body_) { 
      debug writeln("Has body_");
      body_["title"] = bodyTitle; 
    }
    
    if (footer) {
      debug writeln("Has footer");
      footer["title"] = footerTitle;
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPForm~":DAPPForm("~this.name~")::toH5");
    super.toH5(options);
    
    DBS5Col _col = BS5Col(["col-12"]);
    _col(
      H5Form("entityForm", ["card"], ["method":method, "action":action], 
        (header ? header.toH5(options) : null)~
        (body_ ? body_.toH5(options) : null)~
        (footer ? footer.toH5(options) : null)
      ));
    
    return [_col].toH5;
  }  
}
mixin(APPFormCalls!("APPForm"));
