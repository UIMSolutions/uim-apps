module uim.apps.controllers.pages.sites;

@safe:
import uim.apps;

class DAPPSitesPage : DAPPPageController {
  mixin(APPPageControllerThis!("APPSitesPage"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this
    .title("Anmeldung (Kennung)")
    .view(ViewSites(this));

    this.scripts.addLinks(
      "/js/apps/app.js",   
      "/js/apps/login.js");

    this.scripts.addContents(`
      window.addEventListener('load', (event) => {
        document.getElementById("loginForm").addEventListener("submit", event => {
          event.preventDefault();
          login("loginForm");
        })
      });`);
    }
  }
mixin(APPPageControllerCalls!("APPSitesPage"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPSitesPage); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPSitesPage); 
}}