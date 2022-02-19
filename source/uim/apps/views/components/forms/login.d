module uim.apps.views.components.forms.login;

@safe:
import uim.apps;

class DAPPLoginForm : DAPPForm {
  mixin(APPFormThis!("APPLoginForm"));

  mixin(OProperty!("bool", "showLostAccount"));

  override void initialize() {
    super.initialize;

    this.showLostAccount(true);
  }
  
  override DAPPViewComponent copy() {
    return
      (cast(DAPPLoginForm)copy)
      .showLostAccount(this.showLostAccount);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);

    DH5Obj[] results; 
    
    results ~=  
      H5Form("loginForm", ["card", "card-md"], ["method":"post", "autocomplete":"off", "action":"/login_action"], 
        H5Div(["card-body"], 
        H5H2(["card-title", "text-center", "mb-4"], "Anmeldung"),
        H5Div(["mb-3"], 
          H5Label(["form-label"], H5String("Kennung"),
            (showLostAccount ? H5Span(["form-label-description"], 
              H5A(["href":"/lostaccount"], "Kennung vergessen?")) : null)),
          BS5InputText("accountName", ["name":"accountName", "placeholder":"Bitte die Kennung eingeben"]),
          H5Div(["invalid-feedback"], "Bitte eine gültige Kennung eingeben")
        ),
        H5Div(["form-footer"], 
          BS5ButtonSubmit(["btn-primary w-100"], "Zur Passworteingabe")
        )
      ));

    return results;
  }
}
mixin(APPFormCalls!("APPLoginForm"));

version(test_uim_apps) {
  unittest {
    // TODO
}}
