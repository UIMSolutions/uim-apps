module uim.apps.views.login;

@safe:
import uim.apps;

class DAPPViewLogin : DAPPView {
  this() { super(); }
  this(DH5AppController aController) { this().controller(aController); }
  this(string aName) { this().name(aName); }
  this(DH5AppController aController, string aName) { this(aController).name(aName); }

  override void beforeH5(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DAPPViewLogin~":DAPPViewLogin::beforeH5").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    auto rootPath = options.get("rootPath", "/");
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

    _h5Content ~= H5Div(["container-tight py-4"], 
        BS5Row("messages", ["mt-2 mb-2"]),
        H5Div(["text-center mb-4"], 
          H5A(["href":"https://ui-manufaktur.com"], H5Img(["src":"/img/uim.png", "height":"80", "alt":"UI Manufaktur UG - Erfolgreich im Internet"]))),
          appLoginForm(),
          H5Div(["text-center text-muted mt-3"], 
            H5String("Noch kein Konto bei uns? "), H5A(["href":"/register", "tabindex":"-1"], "Registrieren")
      ));       
  }
}
auto APPViewLogin() { return new DAPPViewLogin(); }
auto APPViewLogin(DH5AppController aController) { return new DAPPViewLogin(aController); }
auto APPViewLogin(string aName) { return new DAPPViewLogin(aName); }
auto APPViewLogin(DH5AppController aController, string aName) { return new DAPPViewLogin(aController, aName); }