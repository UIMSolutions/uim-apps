module uim.apps.controllers.pages.logout;

@safe:
import uim.apps;

class DAPPLogoutPage : DAPPPage {
  this() { super(); 
    this.parameters([
          "pageTitle": "Abmeldung erfolgreich",
          "pageBreadcrumbs":`<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Abmeldung</a></li>
</ol>`])
      .title("Abmeldung");
  }
}
auto APPLogoutPage() { return new DAPPLogoutPage; }