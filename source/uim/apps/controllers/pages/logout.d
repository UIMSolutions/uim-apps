module uim.apps.controllers.pages.logout;

@safe:
import uim.apps;

class DAPPLogoutPageController : DAPPPageController {  
  mixin(APPPageControllerThis!("APPLogoutPageController"));

  override void initialize() { 
    super.initialize;

    this.parameters([
          "pageTitle": "Abmeldung erfolgreich",
          "pageBreadcrumbs":`<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Abmeldung</a></li>
</ol>`])
      .title("Abmeldung");
  }
}
mixin(APPPageControllerCalls!("APPLogoutPageController"));
