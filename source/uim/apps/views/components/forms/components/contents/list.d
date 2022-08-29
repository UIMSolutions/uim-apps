module uim.apps.views.components.forms.components.contents.list;

@safe:
import uim.apps;

class DAPPListFormContent : DEntitiesFormContent {
  mixin(FormComponentThis!("APPListFormContent"));

  mixin(OViewComponent!("listItem"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPListFormContent~"::DAPPListFormContent("~this.name~"):initialize");   
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesFormContent~"DEntitiesFormContent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] listItems = entities.map!(entity => entity ? listItem.entity(entity).toH5 : null).join; 
      
    return [
      BS5ListGroup(["list-group-flush"], listItems)
    ].toH5;
  } 
}
mixin(FormComponentCalls!("APPListFormContent"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPListFormContent);
    assert(APPListFormContent);
    assert(new DAPPListFormContent(Form));
    assert(APPListFormContent(Form));
  }
}