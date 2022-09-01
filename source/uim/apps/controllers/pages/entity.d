module uim.apps.controllers.pages.entity;

@safe:
import uim.apps;

class DAPPEntityPageController : DAPPPageController {
  mixin(APPControllerThis!("APPEntityPageController"));

  protected DOOPEntity _entity;
  DOOPEntity entity() { 
    return _entity; 
  }
  O entity(this O)(DOOPEntity newEntity) { 
    _entity = newEntity;

    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);
    }
    
    return cast(O)this; 
  }

  mixin(OProperty!("string", "entityName"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPPageController~":DAPPPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
    
    this.entityName = options.get("entityName", null);
  }
}
mixin(APPControllerCalls!("APPEntityPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPEntityPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPEntityPageController); 
}}
