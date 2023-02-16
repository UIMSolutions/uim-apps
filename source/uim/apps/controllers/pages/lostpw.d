module uim.apps.controllers.pages.lostpw;

@safe:
import uim.apps;

class DAPPLostPasswordPageController : DAPPPageController {
  mixin(APPPageControllerThis!("APPLostPasswordPageController"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this
      .parameter("pageTitle", "Passwort vergessen?")
      .parameter("pageBreadcrumbs",`<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Passwort vergessen</a></li>
</ol>`)
      .title("Passwort vergessen")
      .view(APPLostPasswordView(this));
  }
}
mixin(APPPageControllerCalls!("APPLostPasswordPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPLostPasswordPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPLostPasswordPageController); 
}}