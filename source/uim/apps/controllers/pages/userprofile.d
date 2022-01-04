module uim.apps.controllers.pages.userprofile;

@safe:
import uim.apps;

class DAPPUserProfilePageController : DAPPPageController {
      this() { super(); 
          this.parameters([
      "pageTitle": "Registrierung",
      "pageBreadcrumbs":`<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Registrierung</a></li>
</ol>`])
      .title("Registrierung");
  }
}
auto APPUserProfilePageController() { return new DAPPUserProfilePageController; }