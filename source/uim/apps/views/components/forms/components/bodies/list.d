module uim.apps.views.components.forms.components.bodies.list;

@safe:
import uim.apps;

class DAPPListFormBody : DAPPEntitiesFormBody {
  mixin(APPFormComponentThis!("APPListFormBody"));

  mixin(OProperty!("DAPPEntityViewComponent", "listItem"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPListFormBody~"::DAPPListFormBody("~this.name~"):initialize");   
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntitiesFormBody~"DAPPEntitiesFormBody::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] listItems = entities.map!(entity => entity ? listItem.entity(entity).toH5 : null).join; 
      
    return [
      BS5ListGroup(["list-group-flush"], listItems)
    ].toH5;
  } 
}
mixin(APPFormComponentCalls!("APPListFormBody"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPListFormBody);
    assert(APPListFormBody);
    assert(new DAPPListFormBody(APPForm));
    assert(APPListFormBody(APPForm));
  }
}