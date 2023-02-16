module uim.apps.controllers.pages.login2;

@safe:
import uim.apps;

class DAPPLogin2PageController : DAPPPageController {
  mixin(APPPageControllerThis!("APPLogin2PageController"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this
    .title("Anmeldung (Passwort)")
/*     .scripts(`
      window.addEventListener('load', (event) => {
        document.getElementById("loginForm").addEventListener("submit", event => {
          event.preventDefault();
          login("loginForm");
        })
      });`) */
      .parameter("pageTitle", "Anmeldung")
      .parameter("pageBreadcrumbs", `<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Anmeldung (Passwort)</a></li>
</ol>`)
      .title("Anmeldung (Passwort)")
      .view(APPLogin2View(this));
    
    this.scripts.addLinks(
      "/js/apps/app.js",   
      "/js/apps/login2.js");   
    }
}
mixin(APPPageControllerCalls!("APPLogin2PageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPLogin2PageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPLogin2PageController); 
}}