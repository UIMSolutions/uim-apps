module uim.apps.views.components.entity;

@safe:
import uim.apps;

class DEntityViewComponent : DAPPViewComponent {
  mixin(ViewComponentThis!("EntityViewComponent"));

  mixin(OProperty!("DEntity", "entity"));
  mixin(OProperty!("CRUDModes", "crudMode"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntityViewComponent~":DEntityViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(ViewComponentCalls!("EntityViewComponent"));
