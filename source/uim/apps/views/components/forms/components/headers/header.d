module uim.apps.views.components.forms.components.headers.header;

@safe:
import uim.apps;

class DAPPFormHeader : DAPPFormComponent {
  mixin(APPFormComponentThis!("APPFormHeader"));

  override void initialize() {
    super.initialize;

    this
    .id("formheader-%s".format(uniform(1,1_000)))
    .crudMode(CRUDModes.Create); 
  }
  
  mixin(OProperty!("string", "mainTitle"));
  mixin(OProperty!("string", "subTitle"));
  mixin(OProperty!("string[][]", "actions"));
/*   O actions(this O)(string[][] newActions...) { 
    this.actions(newActions); 
    return cast(O)this;
  } */

  DH5Obj actionButton(string action, STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPFormHeader~":DAPPFormHeader::actionButton");

    switch(action) {
      case "refresh": return buttonLinkRefresh(rootPath); 
      case "list": return buttonLinkList(rootPath); 
      case "cancel2root": return buttonLinkCancel(rootPath); 
      case "save": return submitSave();       
      default: return null;       
    }
  }

  DH5Obj[] actionButtons(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPFormHeader~":DAPPFormHeader::actionButtons");
    debug writeln ("Actions: ", this.actions);

    DH5Obj[] results;
    foreach(actionGroup; actions) {
      debug writeln ("Action Group: ", this.actions);
      results ~= BS5ButtonGroup(["ms-3"], actionGroup
        .map!(action => actionButton(action, options))
        .filter!(button => button) // no nulls
        .array);
    }    
    return results;
  }

  DH5Obj h5CardHeader(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPFormHeader~":DAPPFormHeader::h5CardHeader");

    return BS5CardHeader(id,
      H5H4(["card-title me-auto"], title),
      H5Div(["btn-list"], 
        H5Span(["d-none d-sm-inline"], actionButtons(options))));    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPFormHeader~":DAPPFormHeader::beforeH5");
    super.beforeH5(options);

    if (form) {
      this.crudMode(form.crudMode);
      this.rootPath(form.rootPath);
    }
    if (!rootPath && "rootPath" in options) {
      this.rootPath(options["rootPath"]);
    }
  } 

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPFormHeader~":DAPPFormHeader::toH5");
    super.toH5(options);
    if (hasError) { return null; }

    return [h5CardHeader(options)];
  }
}
mixin(APPFormComponentCalls!("APPFormHeader"));

unittest {
  version (test_uim_apps) {
    assert(new DAPPFormHeader);
    assert(APPFormHeader);
  }
}