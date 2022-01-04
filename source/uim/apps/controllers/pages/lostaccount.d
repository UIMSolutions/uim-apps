module uim.apps.controllers.pages.lostaccount;

@safe:
import uim.apps;

class DAPPLostAccountPageController : DAPPPageController {
  mixin(APPPageThis!("APPLostAccountPageController"));

  override void initialize() {
    super.initialize;
    
    this.parameters([
      "pageTitle": "Kennung vergessen?",
      "pageBreadcrumbs":`<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Kennung vergessen</a></li>
</ol>`])
      .title("Kennung vergessen")
      .view(APPLostAccountView(this));
  }
}
mixin(APPPageCalls!("APPLostAccountPageController"));
