module uim.apps.controllers.pages.lostpw;

@safe:
import uim.apps;

class DAPPLostPWPage : DAPPPage {
  this() { super(); 
    this.parameters([
      "pageTitle": "Passwort vergessen?",
      "pageBreadcrumbs":`<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Passwort vergessen</a></li>
</ol>`])
      .title("Passwort vergessen")
      .view(APPViewLostPw(this));
  }
}
auto APPLostPWPage() { return new DAPPLostPWPage; }