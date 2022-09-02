module uim.apps.views.lostpw;

@safe:
import uim.apps;

class DAPPLostPasswordView : DView {
  mixin(ViewThis!("APPLostAccountView"));

  override void beforeH5(STRINGAA options = null) { 
    debugMethodCall(moduleName!DAPPLostPasswordView~":DAPPLostPasswordView::beforeH5");
    super.beforeH5(options);
    if (hasError) { return; }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);

    auto rootPath = options.get("rootPath", "/");

    return [
      H5Div(["container-xl"],
        // pageTitle("Login"),
        BS5Row(["row-cards"],
          BS5Col(["col-md-6"],
            BS5Card
            .header(
              H5H3(["card-title"], "Lost Passwort"))
            .body_(
              H5Form(["method":"post", "action": rootPath~"login2action"],
                BS5FormGroup(["mb-3"], 
                  BS5FormLabel("Password"),
                  UIMPasswordInput.name("loginPW").placeholder("Bitte das Passwort eingeben"),
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
auto APPLostPasswordView() { return new DAPPLostPasswordView(); }
auto APPLostPasswordView(DAPPPageController aController) { return new DAPPLostPasswordView(aController); }