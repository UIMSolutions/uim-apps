module uim.apps.controllers.pages.register;

@safe:
import uim.apps;

class DAPPRegisterPageController : DAPPPageController {
  mixin(APPPageControllerThis!("APPRegisterPageController"));      
  
  override void initialize() {
    super.initialize;

    this
    .parameters([
      "pageTitle": "Registrierung",
      "pageBreadcrumbs":`<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Registrierung</a></li>
</ol>`])
      .title("Registrierung");
  }
}
mixin(APPPageControllerCalls!("APPRegisterPageController"));