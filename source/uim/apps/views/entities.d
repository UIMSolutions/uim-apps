module uim.apps.views.entities;

@safe:
import uim.apps;

// View with entities
class DEntitiesView : DAPPView {
  mixin(APPViewThis!("EntitiesView"));
  
  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesView~":DEntitiesView("~this.name~")::beforeH5");
    super.beforeH5(options);

    debug writeln("In DEntitiesView -> %s entities".formats(this.entities.length));
    this
      .components.all
        .filter!(comp => cast(DEntitiesViewComponent)comp)
        .each!(comp => (cast(DEntitiesViewComponent)comp).entities(this.entities));
  }
}
mixin(APPViewCalls!("EntitiesView"));
