module uim.apps.controllers.pages.userprofile;

@safe:
import uim.apps;

class DAPPUserProfilePageController : DAPPPageController {
  mixin(APPPageControllerThis!("APPUserProfilePageController"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this
      .parameter("pageTitle", "Registrierung")
      .parameter("pageBreadcrumbs", `<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Registrierung</a></li>
</ol>`)
      .title("Registrierung");
  }
}
mixin(APPPageControllerCalls!("APPUserProfilePageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPUserProfilePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPUserProfilePageController); 
}}