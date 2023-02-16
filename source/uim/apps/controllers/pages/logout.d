module uim.apps.controllers.pages.logout;

@safe:
import uim.apps;

class DAPPLogoutPageController : DAPPPageController {  
  mixin(APPPageControllerThis!("APPLogoutPageController"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings); 
    super.initialize;

    this
      .parameter("pageTitle",  "Abmeldung erfolgreich")
      .parameter("pageBreadcrumbs", `<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Abmeldung</a></li>
</ol>`)
      .title("Abmeldung");
  }
}
mixin(APPPageControllerCalls!("APPLogoutPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPLogoutPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPLogoutPageController); 
}}