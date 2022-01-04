module uim.apps.views.lostaccount;

@safe:
import uim.apps;

class DAPPLostAccountView : DAPPView {
  mixin(APPViewThis!("APPLostAccountView"));

  override void beforeH5(STRINGAA options = null) { 
    debug writeln(StyledString(moduleName!DAPPLostAccountView~":DAPPLostAccountView::beforeH5").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    auto rootPath = options.get("rootPath", "/");

    return [H5Div(["container-xl"],
        // pageTitle("Login"),
        BS5Row(["row-cards"],
          BS5Col(["col-md-6"],
            BS5Card
            .header(
              H5H3(["card-title"], "Lost Account"))
            .body_(
              H5Form(["method":"post", "action": rootPath~"login2action"],
                BS5FormGroup(["mb-3"], 
                  BS5FormLabel("Password"),
                  BS5InputPassword(["name":"loginPW", "placeholder":"Bitte das Passwort eingeben"]),
                  H5Small(["form-hint"], "Passwort vergessen?")
                ),
                H5Div(["form-footer"], 
                  BS5ButtonSubmit(["btn-primary"], "Anmelden"))
              )
            )
          )     
        )
      )].toH5;       
  }      
}
mixin(APPViewCalls!("APPLostAccountView"));
