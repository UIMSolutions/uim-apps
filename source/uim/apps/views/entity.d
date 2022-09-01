module uim.apps.views.entity;

@safe:
import uim.apps;

// View with entity
class DEntityView : DAPPView {
  mixin(APPViewThis!("EntityView"));
  
  mixin(OProperty!("DOOPEntity", "entity"));

  void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntityView~":DEntityView("~this.name~")::beforeH5");
    super.beforeH5(options);

    debug writeln("In DEntityView -> %s components".formats(this.components.length));
    this
      .components
        .filter!(comp => cast(DEntityViewComponent)comp)
        .each!(comp => (cast(DEntityViewComponent)comp).entity(this.entity));
  }
}
mixin(APPViewCalls!("EntityView"));
