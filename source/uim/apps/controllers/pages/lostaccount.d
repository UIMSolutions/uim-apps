module uim.apps.controllers.pages.lostaccount;

@safe:
import uim.apps;

class DAPPLostAccountPageController : DAPPPageController {
  mixin(APPPageControllerThis!("APPLostAccountPageController"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;
    
    this
      .parameter("pageTitle", "Kennung vergessen?")
      .parameter("pageBreadcrumbs", `<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Kennung vergessen</a></li>
</ol>`)
      .title("Kennung vergessen")
      .view(
        APPLostAccountView(this));
  }
}
mixin(APPPageControllerCalls!("APPLostAccountPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPLostAccountPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPLostAccountPageController); 
}}