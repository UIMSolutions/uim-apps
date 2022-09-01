module uim.apps.views.components.entities;

@safe:
import uim.apps;

class DEntitiesViewComponent : DViewComponent {
  mixin(ViewComponentThis!("EntitiesViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesViewComponent~":DEntitiesViewComponent("~this.name~")::beforeH5");
    super.beforeH5(options);

    debug writeln("In DEntitiesViewComponent -> Found %s entities".format(this.entities.length));
    this
      .components.all
        .filter!(comp => cast(DEntitiesViewComponent)comp)
        .each!(comp => (cast(DEntitiesViewComponent)comp).entities(this.entities));
  }
}
mixin(ViewComponentCalls!("EntitiesViewComponent"));
