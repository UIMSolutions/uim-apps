module uim.apps.controllers.pages.apps;

@safe:
import uim.apps;

/* class DAPPPage : DAPPPageController {
  this() { super(); 
    this
    
    
    .title("Anmeldung (Kennung)")
    .scripts(`
      window.addEventListener('load', (event) => {
        document.getElementById("loginForm").addEventListener("submit", event => {
          event.preventDefault();
          login("loginForm");
        })
      });`);
    }

  // mixin(OProperty!("string", "path"));


  DH5Obj action(string name) {
    switch(name) {
      case "refresh": return buttonLinkRefresh(this.path); 
      case "list": return buttonLinkList(this.path);
      case "create": return buttonLinkCreate(this.path);
      case "read": return buttonLinkView(this.path, this.id);
      case "update": return buttonLinkEdit(this.path, this.id);
      case "delete": return buttonLinkDelete(this.path, this.id);
      default: return H5String("&nbsp;");
    }
  }

  override string content(STRINGAA reqParameters) { 
    reqParameters["pageTitle"] = this.pageTitle;
    reqParameters["pageBreadcrumbs"] = this.pageTitle;
    reqParameters["pageActions"] = pageActions.map!(a => action(a).toString).array.join();

    if (this.loginRequired) {
      auto sessionId = reqParameters.get("sessionId", "");
      // debug writeln("SessionId = ", sessionId);

      auto sessionToken = this.app.database.findOne("central", "sessions", ["id":sessionId]);
      if (sessionToken == Json(null)) {
        // debug writeln("SessionId not found in central.sessions -> ");
        _response.redirect("/login"); return ""; }
    } 
    auto rootPath = parameters.get("rootPath", "/");
    auto message = BS5Row; 
    writeln("_request.peer -> ", _request.peer);
    writeln("app.peers -> ", app.peers.byKey);
    if ((_request.peer in app.peers) && ("message" in app.peers[_request.peer])) {
      auto messageItems = app.peers[_request.peer]["message"].split("/");
      message(
        BS5Alert(["alert-"~messageItems[0], "alert-dismissible"], 
          H5Div(["d-flex"], 
            H5Div(
              `<svg xmlns="http://www.w3.org/2000/svg" class="icon alert-icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"], <path stroke="none" d="M0 0h24v24H0z" fill="none"], </path><circle cx="12" cy="12" r="9"], </circle><line x1="12" y1="8" x2="12" y2="12"], </line><line x1="12" y1="16" x2="12.01" y2="16"], </line></svg>`
            ),
            H5Div(
              H5H4(["alert-title"], messageItems[1]),
              H5Div(["text-muted"], messageItems[2])
            )
          ),
          H5Div(
            H5A(["btn-close"], ["data-bs-dismiss":"alert", "aria-label":"close"]))
          )
        );
      app.peers[_request.peer].remove("message");
    }

    return           
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
            UIMTextInput("accountName", ["placeholder":"Bitte die Kennung eingeben"]),
            H5Div(["invalid-feedback"], "Bitte eine gültige Kennung eingeben")
          ),
          H5Div(["form-footer"], 
            BS5ButtonSubmit(["btn-primary w-100"], "Zur Passworteingabe")
          )
        )),
      H5Div(["text-center text-muted mt-3"], 
        H5String("Noch kein Konto bei uns? "), H5A(["href":"/register", "tabindex":"-1"], "Registrieren")
      )).toString;       
    }
  }
auto APPPage() { return new DAPPPage; } */