module uim.apps.controllers.pages.error;

@safe:
import uim.apps;

class DAPPErrorPageController : DAPPPageController {
  mixin(APPPageControllerThis!("APPErrorPageController"));
}
mixin(APPPageControllerCalls!("APPErrorPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPErrorPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPErrorPageController); 
}}