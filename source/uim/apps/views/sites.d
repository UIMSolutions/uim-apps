module uim.apps.views.sites;

@safe:
import uim.apps;

class DAPPViewSites : DAPPView {
  this() { super(); }
  this(DH5AppController aController) { this().controller(aController); }
  this(string aName) { this().name(aName); }
  this(DH5AppController aController, string aName) { this(aController).name(aName); }

  override void beforeH5(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DAPPViewSites~":DAPPViewSites::beforeH5").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeH5(options);
        if (hasError) { return; }

    auto rootPath = options.get("rootPath", "/");
    auto message = BS5Row; 
    string[] messageItems; 
    message(
      BS5Alert(["alert-"~messageItems[0], "alert-dismissible"], 
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

    _h5Content ~=            
      H5Div(["container-tight py-4"], 
        BS5Row("messages", ["mt-2 mb-2"]),
        H5Div(["text-center mb-4"], 
          H5A(["href":"https://ui-manufaktur.com"], H5Img(["src":"/img/uim.png", "height":"80", "alt":"UI Manufaktur UG - Erfolgreich im Internet"]))),
        H5Form("loginForm", ["card", "card-md"], ["method":"post", "autocomplete":"off"], 
          H5Div(["card-body"], 
          H5H2(["card-title", "text-center", "mb-4"], "Anmeldung"),
          H5Div(["mb-3"], 
            H5Label(["form-label"], H5String("Kennung"),
              H5Span(["form-label-description"], 
                H5A(["href":"/lostaccount"], "Kennung vergessen?"))),
            BS5InputText("accountName", ["placeholder":"Bitte die Kennung eingeben"]),
            H5Div(["invalid-feedback"], "Bitte eine gültige Kennung eingeben")
          ),
          H5Div(["form-footer"], 
            BS5ButtonSubmit(["btn-primary w-100"], "Zur Passworteingabe")
          )
        )),
      H5Div(["text-center text-muted mt-3"], 
        H5String("Noch kein Konto bei uns? "), H5A(["href":"/register", "tabindex":"-1"], "Registrieren")
      ));       
  }
}
auto APPViewSites() { return new DAPPViewSites(); }
auto APPViewSites(DH5AppController aController) { return new DAPPViewSites(aController); }
auto APPViewSites(string aName) { return new DAPPViewSites(aName); }
auto APPViewSites(DH5AppController aController, string aName) { return new DAPPViewSites(aController, aName); }