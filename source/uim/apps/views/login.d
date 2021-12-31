module uim.apps.views.login;

@safe:
import uim.apps;

class DAPPLoginView : DAPPView {
  mixin(APPViewThis!("APPLoginView"));
  this(string aName) { this().name(aName); }
  this(DAPPPageController aController, string aName) { this(aController).name(aName); }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPLoginView~":DAPPLoginView::beforeH5");
    auto rootPath = options.get("rootPath", "/");
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);

    auto message = BS5Row; 
  
    string[] messageItems;
    message(
      BS5Alert(["alert-"~"messageItems[0]", "alert-dismissible"], 
        H5Div(["d-flex"], 
          H5Div(
          `<svg xmlns="http://www.w3.org/2000/svg" class="icon alert-icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><circle cx="12" cy="12" r="9"], </circle><line x1="12" y1="8" x2="12" y2="12"], </line><line x1="12" y1="16" x2="12.01" y2="16"], </line></svg>`
        ),
        H5Div(
/*             H5H4(["alert-title"], messageItems[1]),
          H5Div(["text-muted"], messageItems[2])
*/          )
      ),
      H5Div(
        H5A(["btn-close"], ["data-bs-dismiss":"alert", "aria-label":"close"]))
      )
    );

    return [
      H5Div(["container-tight py-4"], 
        BS5Row("messages", ["mt-2 mb-2"]),
        H5Div(["text-center mb-4"], 
          H5A(["href":"https://ui-manufaktur.com"], H5Img(["src":"/img/uim.png", "height":"80", "alt":"UI Manufaktur UG - Erfolgreich im Internet"]))),
          appLoginForm(),
          H5Div(["text-center text-muted mt-3"], 
            H5String("Noch kein Konto bei uns? "), H5A(["href":"/register", "tabindex":"-1"], "Registrieren")
      ))].toH5;       
  }
}
auto APPLoginView() { return new DAPPLoginView(); }
auto APPLoginView(DAPPPageController aController) { return new DAPPLoginView(aController); }
auto APPLoginView(string aName) { return new DAPPLoginView(aName); }
auto APPLoginView(DAPPPageController aController, string aName) { return new DAPPLoginView(aController, aName); }