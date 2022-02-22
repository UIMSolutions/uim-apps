module uim.apps.views.components.forms.components.headers.entity;

@safe:
import uim.apps;

class DAPPEntityFormHeader : DAPPFormHeader, IAPPWithEntity {
  mixin(APPFormComponentThis!("APPEntityFormHeader"));

  mixin(OProperty!("DOOPEntity", "entity"));

  override DH5Obj actionButton(string action, STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityFormHeader~":DAPPEntityFormHeader::actionButton");
    debug writeln("Action: ", action);

    string entityId = entity ? entity.id.toString : null;

    switch(action) {
      case "create": return buttonLinkCreate(rootPath); 
      case "read": 
      case "view": return buttonLinkView(rootPath, entityId); 
      case "edit":  
      case "update": return buttonLinkEdit(rootPath, entityId); 
      case "delete": return buttonLinkDelete(rootPath, entityId); 
      case "finalDelete": return submitDelete(); 
      case "version": return buttonLinkVersion(rootPath, entityId); 
      case "print": return buttonLinkPrint(rootPath, entityId); 
      case "export": return buttonLinkExport(rootPath, entityId); 
      default: return super.actionButton(action, options);       
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityFormHeader~":DAPPEntityFormHeader::beforeH5");
    debug writeln("RootPath -> ", this.rootPath);
    debug writeln("RootPath (options) -> ", options.get("rootPath", null));
    super.beforeH5(options);

    if (form) {
      if (auto formWithEntity = cast(IAPPWithEntity)form) {
        this.entity(formWithEntity.entity);
      }
    }
  } 

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityFormHeader~":DAPPEntityFormHeader::toH5");
    debug writeln("RootPath -> ", this.rootPath);
    debug writeln("RootPath (options) -> ", options.get("rootPath", null));
    super.toH5(options);

    DH5Obj[] buttons = actionButtons(options);    
    string entityId = this.entity ? this.entity.id.toString : null;

    return  
      [
        BS5CardHeader(id,
        H5H4(["card-title me-auto"], "ID: "~entityId),
        H5Div(["btn-list"], 
          H5Span(["d-none d-sm-inline"], buttons)))].toH5;    
  } 
}
mixin(APPFormComponentCalls!("APPEntityFormHeader"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPEntityFormHeader);
    assert(APPEntityFormHeader);
    assert(new DAPPEntityFormHeader(APPForm));
    assert(APPEntityFormHeader(APPForm));
  }
}