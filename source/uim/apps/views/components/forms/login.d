module uim.apps.views.components.forms.login;

@safe:
import uim.apps;

class DAPPLoginForm : DForm {
  mixin(FormThis!("APPLoginForm"));

  mixin(OProperty!("bool", "showLostAccount"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this.showLostAccount(true);
  }
  
/*   override DAPPViewComponent copy() {
    return
      (cast(DAPPLoginForm)copy)
      .showLostAccount(this.showLostAccount);
  } */

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);

    return [
      UIMFormCard(["card-md"], ["autocomplete":"off"]).method("post").action("/login_action")( 
        UIMCardBody( 
          H5H2(["card-title", "text-center", "mb-4"], "Anmeldung"),
          H5Div(["mb-3"], 
            H5Label(["form-label"], H5String("Kennung"),
              (showLostAccount ? H5Span(["form-label-description"], 
                H5A(["href":"/lostaccount"], "Kennung vergessen?")) : null)),
            UIMTextInput.id("accountName").name("accountName").placeholder("Bitte die Kennung eingeben")
              .invalidText("Bitte eine gültige Kennung eingeben")
          ),
          H5Div(["form-footer"], 
            BS5ButtonSubmit(["btn-primary w-100"], "Zur Passworteingabe")
          )
        )
      )
    ].toH5;
  }
}
mixin(FormCalls!("APPLoginForm"));

version(test_uim_apps) { unittest {
  assert(APPLoginForm);
}}
