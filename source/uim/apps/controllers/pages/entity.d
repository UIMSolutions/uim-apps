module uim.apps.controllers.pages.entity;

@safe:
import uim.apps;

class DAPPEntityPageController : DAPPPageController, IAPPWithEntity {
  mixin(APPControllerThis!("APPEntityPageController"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPControllerCalls!("APPEntityPageController"));

version(test_uim_apps) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPEntityPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPEntityPageController); 
}}
