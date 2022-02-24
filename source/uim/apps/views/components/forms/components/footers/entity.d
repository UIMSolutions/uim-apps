module uim.apps.views.components.forms.components.footers.entity;

@safe:
import uim.apps;

class DAPPEntityFormFooter : DAPPFormFooter, IAPPWithEntity {
  mixin(APPFormComponentThis!("APPEntityFormFooter", true));

  mixin(OProperty!("DOOPEntity", "entity"));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityFormFooter~"::DAPPEntityFormFooter("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(APPFormComponentCalls!("APPEntityFormFooter", true));

