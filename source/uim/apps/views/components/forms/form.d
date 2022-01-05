module uim.apps.views.components.forms.form;

@safe:
import uim.apps;

class DAPPForm : DAPPViewComponent {
  this() { super(); }
  /* this(string myPath, CRUDModes crudMode) {
    this();
    this
    .rootPath(myPath).crudMode(crudMode)
    .action(myPath~"/actions/"~to!string(crudMode).toLower);
  } */
  this(DAPPView myView) { this().view(myView); }

  override void initialize() {
    super.initialize;

    this
    .crudMode(CRUDModes.Read)
    .formHeader(APPFormHeader)
    .formBody(APPFormBody)
    .method("post");
  }

  mixin(OProperty!("CRUDModes", "crudMode"));
  
  mixin(OProperty!("DAPPFormComponent", "formHeader"));
  mixin(OProperty!("DAPPFormComponent", "formBody"));
  mixin(OProperty!("DAPPFormComponent", "formFooter"));

  mixin(OProperty!("string", "rootPath"));

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
    super.beforeH5(options);

    if (auto entityView = cast(DAPPEntityView)this.view) {
      this.crudMode(entityView.crudMode);
      this.readonly(entityView.readonly);
      this.rootPath(entityView.rootPath);
    }

    foreach(component; [formHeader, formBody, formFooter]) { 
      if (auto formComponent = cast(DAPPFormComponent)component) {
        formComponent
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .entities(this.entities);
      }
    }

    if (formBody) {
      debug writeln("FormBody exists");
    }
    else {
      debug writeln("FormBody missing");
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    
    DBS5Col _col = BS5Col(["col-12"]);
    _col(
      H5Form("entityForm", ["card"], ["method":method, "action":action], 
        (formHeader ? formHeader.title(headerTitle).toH5(options) : null)~
        (formBody ? formBody.title(bodyTitle).entities(this.entities).toH5(options) : null)~
        (formFooter ? formFooter.title(footerTitle).entities(this.entities).toH5(options) : null)
      ));
    if (crudMode != CRUDModes.Create && panes) _col(panes.toH5(options));
    
    return [_col].toH5;
  }  
}
auto APPForm() { return new DAPPForm; }
auto APPForm(DAPPView myView) { return new DAPPForm(myView); }