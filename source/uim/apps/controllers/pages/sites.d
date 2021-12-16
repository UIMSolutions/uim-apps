module uim.apps.controllers.pages.sites;

@safe:
import uim.apps;

class DAPPSitesPage : DH5AppPage {
  this() { super(); 
    this
    .title("Anmeldung (Kennung)")
    .scripts(
      ["src":"/js/apps/app.js"],   
      ["src":"/js/apps/login.js"])   
    .scripts(`
      window.addEventListener('load', (event) => {
        document.getElementById("loginForm").addEventListener("submit", event => {
          event.preventDefault();
          login("loginForm");
        })
      });`)
    .view(APPViewSites(this));
    }
  }
auto APPSitesPage() { return new DAPPSitesPage; }