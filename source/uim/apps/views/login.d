/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.views.login;

@safe:
import uim.apps;

class DAPPLoginView : DAPPView {
  mixin(ViewThis!("APPLoginView"));
  
  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPLoginView~":DAPPLoginView::beforeH5");
    this.rootPath(options.get("rootPath", "/"));
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPLoginView~":DAPPLoginView::toH5");
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
        BS5Row("logo", ["text-center"],  H5A(["href":"https://www.sicherheitsschmiede.de"], 
          H5Img(["src":"/img/logo.png", "height":"80", "alt":"Sicherheitsschmiede - Sicher im Internet"]))),
        BS5Row("form", APPLoginForm.toH5(options)),
        BS5Row("additional", H5Div(["text-center mb-4"], H5Div(["text-center text-muted mt-3"], 
          H5String("Noch kein Konto bei uns? "), H5A(["href":"/register", "tabindex":"-1"], "Registrieren"))))
      )
    ].toH5;
  }
}
mixin(ViewCalls!("APPLoginView"));

version(test_uim_apps) { unittest {
  assert(APPLoginView);
}}