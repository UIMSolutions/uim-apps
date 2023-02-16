module uim.apps.controllers.pages.login;

@safe:
import uim.apps;

class DAPPLoginPageController : DAPPPageController {
  mixin(APPPageControllerThis!("APPLoginPageController"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    debugMethodCall(moduleName!DAPPLoginPageController~"::DAPPLoginPageController("~this.name~"):initialize");   
    super.initialize;

    this
    .title("Anmeldung (Kennung)")
/*     .scripts(`
      window.addEventListener('load', (event) => {
        document.getElementById("loginForm").addEventListener("submit", event => {
          event.preventDefault();
          login("loginForm");
        })
      });`) */
    .parameter("pageTitle", "Anmeldung")
    .parameter("pageBreadcrumbs", `<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Anmeldung (Kennung)</a></li>
</ol>`)
      .title("Anmeldung (Kennung)")
      .view(APPLoginView(this))
      .scripts.addLinks(
        "/js/apps/app.js",   
        "/js/apps/login.js");   
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPLoginPageController~":DAPPLoginPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln("MImeType: ", this.mimetype);
  }
}
mixin(APPPageControllerCalls!("APPLoginPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPLoginPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPLoginPageController); 
}}