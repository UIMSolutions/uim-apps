module uim.apps.views.components.forms.login;

@safe:
import uim.apps;

// #region appLoginForm
auto appLoginForm(string lang = "de") {
  return 
    H5Form("loginForm", ["card", "card-md"], ["method":"post", "autocomplete":"off", "action":"/login_action"], 
      H5Div(["card-body"], 
      H5H2(["card-title", "text-center", "mb-4"], "Anmeldung"),
      H5Div(["mb-3"], 
        H5Label(["form-label"], H5String("Kennung"),
          H5Span(["form-label-description"], 
            H5A(["href":"/lostaccount"], "Kennung vergessen?"))),
        BS5InputText("accountName", ["name":"accountName", "placeholder":"Bitte die Kennung eingeben"]),
        H5Div(["invalid-feedback"], "Bitte eine gültige Kennung eingeben")
      ),
      H5Div(["form-footer"], 
        BS5ButtonSubmit(["btn-primary w-100"], "Zur Passworteingabe")
      )
    ));
}
// #endregion appLoginForm

// #region appLogin2Form
auto appLogin2Form(DOOPEntity login, string lang = "de") {
  return login ? appLogin2Form(login.id, lang) : null; }

auto appLogin2Form(string loginId, string lang = "de") {
  return loginId.isUUID ? appLogin2Form(UUID(loginId), lang) : null; }

auto appLogin2Form(UUID loginId, string lang = "de") {
  // TODO : Translate

  return
    H5Form("loginForm", ["card", "card-md"], ["method":"post", "autocomplete":"off", "action":"login2_action"], 
      BS5InputHidden("loginId", ["name":"loginId"]).value(loginId.toString),
      H5Div(["card-body"], 
        H5H2(["card-title", "text-center", "mb-4"], "Anmeldung"),
        H5Div(["mb-2"], 
          H5Label(["form-label"], H5String("Passwort"),
            H5Span(["form-label-description"], 
              H5A(["href":"/lostpassword"], "Passwort vergessen?"))),
          H5Div(["input-group input-group-flat"], 
            BS5InputPassword("loginPW", ["name":"loginPW", "placeholder":"Passwort eingeben", "autocomplete":"off"]),
            H5Span(["input-group-text"], 
              H5A(["link-secondary"], 
                ["href":"#", "title":"", "data-bs-toggle":"tooltip", "data-bs-original-title":"Passwort anzeigen."], 
                tablerIcon("exe")))),
        H5Div(["invalid-feedback"], "Bitte ein gültiges Passwort eingeben")
      ),
      H5Div(["form-footer"], 
        BS5ButtonSubmit(["btn-primary w-100"], "Zur Anmeldung")
      )
    ));
}
// #endregion appLogin2Form
