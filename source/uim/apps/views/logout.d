module uim.apps.views.logout;

@safe:
import uim.apps;

class DAPPLogoutView : DAPPView {
  mixin(APPViewThis!("APPLogoutView"));

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto appSession = getAppSession(options)) {
      appSessions.remove(appSession.id);
      options.remove("appSessionId");
    }
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

    DH5Obj[] results;
    DH5Obj[] inners;
    
    inners ~= BS5Row("messages", ["mt-2 mb-2"]);
    inners ~= H5A(["href":"https://www.sicherheitsschmiede-de"], 
      H5Img(["src":"/img/uim.png", "height":"80", "alt":"Sicherheitsschmiede - Sicher im Internet"]));

    inners ~= H5Form("loginForm", ["card", "card-md"], ["method":"post", "autocomplete":"off", "action":"/login_action"], 
        H5Div(["card-body"], 
        H5H2(["card-title", "text-center", "mb-4"], "Abgemeldet"),
        H5Div(["mb-3"], "Sie haben sich erfolgreich abgemeldet"),
        H5Div(["form-footer"])
      ));

    inners ~= H5Div(["text-center mb-4"], H5Div(["text-center text-muted mt-3"], 
      H5String("Wieder anmelden? "), H5A(["href":"/login", "tabindex":"-1"], "Anmelden")));

    results ~= H5Div(["container-tight py-4"], inners);     

    return results;  
  }
}
mixin(APPViewCalls!("APPLogoutView"));
