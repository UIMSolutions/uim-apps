module uim.apps.views.components.forms.form;

@safe:
import uim.apps;

class DAPPForm : DAPPViewComponent {
  this() { super(); 
    this
    .crudMode(CRUDModes.Read)
    .formHeader(APPFormHeader)
    .formBody(APPFormBody)
    .method("post");
  }
  this(string myPath, CRUDModes crudMode) {
    this();
    this
    .path(myPath).crudMode(crudMode)
    .action(myPath~"/actions/"~to!string(crudMode).toLower);
  }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPView myView) { this().view(myView); }

  CRUDModes _crudMode;
  CRUDModes crudMode() { return _crudMode; }
  O crudMode(this O)(CRUDModes newMode) { 
    _crudMode = newMode;
    if (formHeader) formHeader.crudMode(newMode);
    if (formBody) formBody.crudMode(newMode);
    return cast(O)this;
  }
  
  DAPPFormHeader _formHeader;
  DAPPFormHeader formHeader() { return _formHeader; };
  O formHeader(this O)(DAPPFormHeader newFormHeader) { _formHeader = newFormHeader ? newFormHeader.form(this) : null; return cast(O)this; };

  DAPPFormBody _formBody;
  DAPPFormBody formBody() { return _formBody; };
  O formBody(this O)(DAPPFormBody newFormBody) { 
    _formBody = newFormBody ? newFormBody.form(this) : null; 
    return cast(O)this; 
  }

  string _path;
  string path() { return _path; }
  O path(this O)(string newPath) { 
    _path = newPath;
    if (formHeader) formHeader.path(newPath);
    if (formBody) formBody.path(newPath);
    return cast(O)this;
  }

  mixin(SProperty!("string[string]", "defaults"));
  mixin(SProperty!("string[]", "fields"));
  mixin(SProperty!("DAPPPanes", "panes"));
  mixin(SProperty!("DOOPEntity", "entity"));
  // mixin(SProperty!("DOOPEntity[]", "entities"));
  mixin(SProperty!("string", "action"));
  mixin(SProperty!("string", "method"));
  mixin(SProperty!("bool", "readonly"));
  mixin(SProperty!("string", "entityName"));
  mixin(SProperty!("string", "entitiesName"));

  protected DBS5Col _col;
  override void beforeH5(STRINGAA options = null) {
    _col = BS5Col(["col-12"]);
    _col(
      H5Form("entityForm", ["card"], ["method":method, "action":action], 
        (formHeader ? formHeader.toH5(options) : null)~
        (formBody ? formBody.toH5(options) : null)
      ));
    if (crudMode != CRUDModes.Create && panes) _col(panes.toH5(options));
    _h5Content ~= _col;
  }  
}
auto APPForm() { return new DAPPForm; }
auto APPForm(DAPPView myView) { return new DAPPForm(myView); }