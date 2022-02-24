module uim.apps.views.components.forms.components.footers.entities;

@safe:
import uim.apps;

class DAPPEntitiesFormFooter : DAPPFormFooter, IAPPWithEntities {
  mixin(APPFormComponentThis!("APPEntitiesFormFooter", false, true));

  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntitiesFormFooter~"::DAPPEntitiesFormFooter("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(APPFormComponentCalls!("APPEntitiesFormFooter", false, true));

