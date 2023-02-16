module uim.apps.views.components.forms.components.contents.list;

@safe:
import uim.apps;

class DAPPListFormContent : DEntitiesViewComponent {
  mixin(ViewComponentThis!("APPListFormContent"));

  mixin(OProperty!("DEntityViewComponent", "templateListItem"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    debugMethodCall(moduleName!DAPPListFormContent~"::DAPPListFormContent("~this.name~"):initialize");   
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesFormContent~"DEntitiesFormContent::toH5");
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    debug writeln("Found entities for table = ", entities.length);

    DH5Obj[] listItems = this.entities.map!(entity => entity ? templateListItem.entity(entity).toH5 : null).join; 
      
    return [
      BS5ListGroup(["list-group-flush"], listItems)
    ].toH5;
  } 
}
mixin(ViewComponentCalls!("APPListFormContent"));

version(test_uim_apps) { unittest {
  assert(APPListFormContent);
}}