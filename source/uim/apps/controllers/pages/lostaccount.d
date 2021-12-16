module uim.apps.controllers.pages.lostaccount;

@safe:
import uim.apps;

class DAPPLostAccountPage : DAPPPage {
  this() { super(); 
    this.parameters([
          "pageTitle": "Kennung vergessen?",
          "pageBreadcrumbs":`<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Kennung vergessen</a></li>
</ol>`])
      .title("Kennung vergessen")
      .view(APPViewLostAccount(this));
  }

}
auto APPLostAccountPage() { return new DAPPLostAccountPage; }