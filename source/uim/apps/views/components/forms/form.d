module uim.apps.views.components.forms.form;

@safe:
import uim.apps;

class DAPPForm : DAPPViewComponent {
  mixin(APPFormThis!("APPForm"));

  override void initialize() {
    super.initialize;

    this
    .crudMode(CRUDModes.Read)
    .formHeader(APPFormHeader)
    .formBody(APPFormBody)
    .method("post");
  }

  mixin(OProperty!("DAPPFormHeader", "formHeader"));
  mixin(OProperty!("DAPPFormBody", "formBody"));
  mixin(OProperty!("DAPPFormFooter", "formFooter"));
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

      if (formHeader) formHeader.crudMode(this.crudMode);
      if (formBody) formBody.crudMode(this.crudMode);
      if (formFooter) formFooter.crudMode(this.crudMode);

      return cast(O)this; 
    }
  // #endregion crudMode

  string _rootPath;
  string rootPath() { return _rootPath; }
  O rootPath(this O)(string newRootPath) {
    _rootPath = newRootPath;

    if (formHeader) formHeader.rootPath(this.rootPath);
    if (formBody) formBody.rootPath(this.rootPath);
    if (formFooter) formFooter.rootPath(this.rootPath);

    return cast(O)this; 
  }


  override DAPPViewComponent clone() {
    return
      APPForm;
  } 

  override DAPPViewComponent copy() {
    return
      APPForm
        .crudMode(this.crudMode)
        .formHeader(this.formHeader)
        .formBody(this.formBody)
        .formFooter(this.formFooter)
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

    foreach(component; [formHeader, formBody, formFooter]) { 
      if (auto formComponent = cast(DAPPFormComponent)component) {
        debug writeln("formComponent ", formComponent.name);
        formComponent
        .crudMode(this.crudMode)
        .rootPath(this.rootPath);
      }
    }

    if (formHeader) {
      debug writeln("Has formHeader");
      formHeader.title(headerTitle); 
    }

    if (formBody) { 
      debug writeln("Has formBody");
      formBody.title(bodyTitle); 
    }
    
    if (formFooter) {
      debug writeln("Has formFooter");
      formFooter.title(footerTitle);
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPForm~":DAPPForm("~this.name~")::toH5");
    super.toH5(options);
    
    DBS5Col _col = BS5Col(["col-12"]);
    _col(
      H5Form("entityForm", ["card"], ["method":method, "action":action], 
        (formHeader ? formHeader.toH5(options) : null)~
        (formBody ? formBody.toH5(options) : null)~
        (formFooter ? formFooter.toH5(options) : null)
      ));
    
    return [_col].toH5;
  }  
}
mixin(APPFormCalls!("APPForm"));
