module uim.apps.controllers.pages.login;

@safe:
import uim.apps;

class DAPPLoginPage : DAPPPageController {
  this() { super(); 
    this
    .title("Anmeldung (Kennung)")
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
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Anmeldung (Kennung)</a></li>
</ol>`])
      .title("Anmeldung (Kennung)")
      .view(APPLoginView(this))
      .scripts.addLinks(
        "/js/apps/app.js",   
        "/js/apps/login.js");   
    }
  }
auto APPLoginPage() { return new DAPPLoginPage; }