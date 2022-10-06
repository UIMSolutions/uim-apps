module uim.apps.views.components.entities;

@safe:
import uim.apps;

class DEntitiesViewComponent : DAPPViewComponent {
  mixin(ViewComponentThis!("EntitiesViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesViewComponent~":DEntitiesViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);
  }
}
mixin(ViewComponentCalls!("EntitiesViewComponent"));
