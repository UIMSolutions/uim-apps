module uim.apps.controllers.pages.sites;

@safe:
import uim.apps;

class DAPPSitesPage : DAPPPageController {
  this() { super(); 
    this
    .title("Anmeldung (Kennung)")
    .view(APPViewSites(this));

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

auto APPSitesPage() { return new DAPPSitesPage; }
auto APPSitesPage(DAPPApplication myApplication) { return APPSitesPage.app(myApplication); }