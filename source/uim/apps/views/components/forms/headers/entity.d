module uim.apps.views.components.forms.headers.entity;

@safe:
import uim.apps;

class DAPPEntityFormHeader : DAPPFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }

  override DH5Obj[] h5Buttons(STRINGAA options = null) {
    super.h5Buttons(options);

    switch(crudMode) {
      case CRUDModes.Create: return [resetClear, submitSave].toH5; 
      case CRUDModes.Read: return null; 
      case CRUDModes.Update: return [resetClear, submitSave].toH5; 
      case CRUDModes.Delete: return [submitDelete].toH5; 
      default: return null;
    }
  }

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);

    DH5Obj[] buttons = h5Buttons(options);    
    string entityId = form && form.entity ? form.entity.id.toString : null;

    _h5Content ~=  
      BS5CardHeader(id,
        H5H4(["card-title me-auto"], "ID: "~entityId),
        H5Div(["btn-list"], 
          H5Span(["d-none d-sm-inline"], buttons)));    
  } 
}
auto APPEntityFormHeader() { return new DAPPEntityFormHeader; }
auto APPEntityFormHeader(DAPPForm myForm) { return new DAPPEntityFormHeader(myForm); }