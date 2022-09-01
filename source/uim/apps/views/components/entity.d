module uim.apps.views.components.entity;

@safe:
import uim.apps;

class DEntityViewComponent : DViewComponent {
  mixin(ViewComponentThis!("EntityViewComponent"));

  mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("CRUDModes", "crudMode"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntityViewComponent~":DEntityViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);

    debug writeln("In DEntityViewComponent -> "~(this.entity ? "has entity" : "no entity"));
    this
      .components.all
        .filter!(comp => cast(DEntityViewComponent)comp)
        .each!(comp => (cast(DEntityViewComponent)comp).entity(this.entity));
  }
}
mixin(ViewComponentCalls!("EntityViewComponent"));
