module uim.apps.controllers.pages.entities;

@safe:
import uim.apps;

class DAPPEntitiesPageController : DAPPPageController, IAPPWithEntities {
  mixin(APPControllerThis!("APPEntitiesPageController"));

  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { 
    return _entities; 
  }
  O entities(this O)(DOOPEntity[] newEntities) { 
    _entities = newEntities;

    if (auto entitiesView = cast(DAPPEntitiesView)this.view) {
      entitiesView.entities(this.entities);
    }
    
    return cast(O)this; 
  }

}
mixin(APPControllerCalls!("APPEntitiesPageController"));

version(test_uim_apps) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPEntitiesPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPEntitiesPageController); 
}}

