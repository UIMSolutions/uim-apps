module uim.apps.views.components.forms.components.headers.header;

@safe:
import uim.apps;

class DFormHeader : DFormComponent {
  mixin(FormComponentThis!("FormHeader"));

  override void initialize() {
    debugMethodCall(moduleName!DFormHeader~"::DFormHeader("~this.name~"):initialize");   
    super.initialize;
    debug writeln("In ", __MODULE__, "/", __LINE__);


    this
    .id("formheader-%s".format(uniform(1,1_000)))
    .crudMode(CRUDModes.Create); 
  }
  
  mixin(APPParameter!("mainTitle"));
  mixin(APPParameter!("subTitle"));
  mixin(OProperty!("string[][]", "actions"));
/*   O actions(this O)(string[][] newActions...) { 
    this.actions(newActions); 
    return cast(O)this;
  } */

  DH5Obj actionButton(string action, STRINGAA options = null) {
    debugMethodCall(moduleName!DFormHeader~":DFormHeader::actionButton");

    switch(action) {
      case "refresh": return buttonLinkRefresh(rootPath); 
      case "list": return buttonLinkList(rootPath); 
      case "cancel2root": return buttonLinkCancel(rootPath); 
      case "save": return submitSave();       
      default: return null;       
    }
  }

  DH5Obj[] actionButtons(STRINGAA options = null) {
    debugMethodCall(moduleName!DFormHeader~":DFormHeader::actionButtons");
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
    debugMethodCall(moduleName!DFormHeader~":DFormHeader::h5CardHeader");

    return BS5CardHeader(id,
      H5H4(["card-title me-auto"], title),
      H5Div(["btn-list"], 
        H5Span(["d-none d-sm-inline"], actionButtons(options))));    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DFormHeader~":DFormHeader::beforeH5");
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
    debugMethodCall(moduleName!DFormHeader~":DFormHeader::toH5");
    super.toH5(options);
    if (hasError) { return null; }

    return [h5CardHeader(options)];
  }
}
mixin(FormComponentCalls!("FormHeader"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DFormHeader);
    assert(FormHeader);
  }
}