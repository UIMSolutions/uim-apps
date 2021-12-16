module uim.apps.views.lostaccount;

@safe:
import uim.apps;

class DAPPViewLostAccount : DAPPView {
  this() { super(); }
  this(DH5AppController aController) { this().controller(aController); }
  this(string aName) { this().name(aName); }
  this(DH5AppController aController, string aName) { this(aController).name(aName); }

  override void beforeH5(STRINGAA options = null) { 
    debug writeln(StyledString(moduleName!DAPPViewLostAccount~":DAPPViewLostAccount::beforeH5").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeH5(options);
    auto rootPath = options.get("rootPath", "/");

    _h5Content ~= H5Div(["container-xl"],
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
      );       
  }      
}
auto APPViewLostAccount() { return new DAPPViewLostAccount(); }
auto APPViewLostAccount(DH5AppController aController) { return new DAPPViewLostAccount(aController); }
auto APPViewLostAccount(string aName) { return new DAPPViewLostAccount(aName); }
auto APPViewLostAccount(DH5AppController aController, string aName) { return new DAPPViewLostAccount(aController, aName); }