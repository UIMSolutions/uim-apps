module uim.apps.controllers.pages.register;

@safe:
import uim.apps;

class DAPPRegisterPage : DAPPPageController {
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
auto APPRegisterPage() { return new DAPPRegisterPage; }