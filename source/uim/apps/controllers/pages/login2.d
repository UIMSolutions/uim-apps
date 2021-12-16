module uim.apps.controllers.pages.login2;

@safe:
import uim.apps;

class DAPPLogin2Page : DAPPPage {
  this() { super(); 
    this
    .title("Anmeldung (Passwort)")
    .scripts(
      ["src":"/js/apps/app.js"],   
      ["src":"/js/apps/login2.js"])   
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
      .view(APPViewLogin2(this));
    }
}

auto APPLogin2Page() { return new DAPPLogin2Page(); }