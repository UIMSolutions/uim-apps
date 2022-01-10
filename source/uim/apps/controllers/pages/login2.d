module uim.apps.controllers.pages.login2;

@safe:
import uim.apps;

class DAPPLogin2PageController : DAPPPageController {
  mixin(APPPageControllerThis!("APPLogin2PageController"));

  override void initialize() {
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
      .parameters([
        "pageTitle": "Anmeldung",
        "pageBreadcrumbs":`<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Anmeldung (Passwort)</a></li>
</ol>`])
      .title("Anmeldung (Passwort)")
      .view(APPLogin2View(this));
    
    this.scripts.addLinks(
      "/js/apps/app.js",   
      "/js/apps/login2.js");   
    }
}
mixin(APPPageControllerCalls!("APPLogin2PageController"));
