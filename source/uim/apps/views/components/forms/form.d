module uim.apps.views.components.forms.form;

@safe:
import uim.apps;

class DAPPForm : DAPPViewComponent {
  mixin(APPFormThis!("APPForm"));

  override void initialize() {
    super.initialize;

    this
      .crudMode(CRUDModes.Read)
      .header(APPFormHeader)
      .body_(APPFormBody)
      .method("post");
  }

  mixin(OProperty!("DAPPFormHeader", "header"));
  mixin(OProperty!("DAPPFormBody", "body_"));
  mixin(OProperty!("DAPPFormFooter", "footer"));

  mixin(OProperty!("string[string]", "defaults"));
  mixin(OProperty!("string[]", "fields"));
  mixin(OProperty!("DAPPPanes", "panes"));
  mixin(OProperty!("string", "action"));
  mixin(OProperty!("string", "method"));
  mixin(OProperty!("bool", "readonly"));
  mixin(OProperty!("string", "entityName"));
  mixin(OProperty!("string", "entitiesName"));
  mixin(OProperty!("string", "headerTitle"));
  mixin(OProperty!("string", "bodyTitle"));
  mixin(OProperty!("string", "footerTitle"));

  // #region crudMode
    CRUDModes _crudMode;
    CRUDModes crudMode() { return _crudMode; }
    O crudMode(this O)(CRUDModes newCrudMode) {
      _crudMode = newCrudMode;

      if (header) header.crudMode(this.crudMode);
      if (body_) body_.crudMode(this.crudMode);
      if (footer) footer.crudMode(this.crudMode);

      return cast(O)this; 
    }
  // #endregion crudMode

  string _rootPath;
  string rootPath() { return _rootPath; }
  O rootPath(this O)(string newRootPath) {
    _rootPath = newRootPath;

    if (header) header.rootPath(this.rootPath);
    if (body_) body_.rootPath(this.rootPath);
    if (footer) footer.rootPath(this.rootPath);

    return cast(O)this; 
  }

  override DAPPViewComponent copy() {
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
  } 

  override string opIndex(string name) {
    switch (name) {
      case "rootPath": return this.rootPath; 
      case "action": return this.action; 
      case "method": return this.method; 

      default: return super.opIndex(name);
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPForm~":DAPPForm("~this.name~")::beforeH5");
    super.beforeH5(options);

    foreach(component; [header, body_, footer]) { 
      if (auto formComponent = cast(DAPPFormComponent)component) {
        debug writeln("formComponent ", formComponent.name);
        formComponent
        .crudMode(this.crudMode)
        .rootPath(this.rootPath);
      }
    }

    if (header) {
      debug writeln("Has header");
      header.title(headerTitle); 
    }

    if (body_) { 
      debug writeln("Has body_");
      body_.title(bodyTitle); 
    }
    
    if (footer) {
      debug writeln("Has footer");
      footer.title(footerTitle);
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
