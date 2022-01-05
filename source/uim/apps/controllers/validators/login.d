module uim.apps.controllers.validators.login;

@safe:
import uim.apps;

class DAPPValidatorLogin : DAPPValidator {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }
  this(DAPPApplication myApp, string myName) { this(myApp).name(myName); }
  this(DAPPApplication myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPApplication myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }

  override DOOPEntity validate(STRINGAA reqParameters) {
    string appSessionId = reqParameters.get("appSessionId", "");
    auto appSession = getAppSession(reqParameters);

    // Looking for a loginId
    auto login = appSession.login;
    if (login) { // No login. Try to read from reqParameters
      auto loginIdParameter = reqParameters.get("loginId", "");      

      if (!loginIdParameter.isUUID && appSession.session) { // No valid loginId, maybe in session
        loginIdParameter = appSession.session["loginId"]; }

      if (!loginIdParameter.isUUID) // No valid loginId
        return null; // :-(

      loginIdParameter = reqParameters["loginId"];
      if (database) { // Look into database
        auto dbLogin = database["central", "logins"].findOne(UUID(loginIdParameter));
        if (dbLogin) {
          // found login :-)
          dbLogin.lastAccessedOn = toTimestamp(now);
          dbLogin.save;
        
          appSession.login = dbLogin;
          return dbLogin;
        }        
      }
    }
    
    return null; // Not valid
  }
  unittest {
    version(test_uim_apps) {
      /// TODO 
    }}

  override Json message(Json json, STRINGAA reqParameters) {
    auto result = super.message(json, reqParameters);

    if (auto login = validate(reqParameters)) { // no validation error :-)
      if ("results" !in result) result["results"] = Json.emptyObject; 
      result["results"]["login"] = login.toJson;
    }
    else { // validation error :-(
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "Login not found";
      result["errors"] ~= error;
    }
    return result;
  }
  unittest {
    version(test_uim_apps) {
      /// TODO 
    }}
}
auto APPValidatorLogin() { return new DAPPValidatorLogin; }
auto APPValidatorLogin(DAPPApplication myApp) { return new DAPPValidatorLogin(myApp); }
auto APPValidatorLogin(DAPPApplication myApp, string myName) { return new DAPPValidatorLogin(myApp, myName); }
auto APPValidatorLogin(DAPPApplication myApp, DETBBase myDatabase) { return new DAPPValidatorLogin(myApp, myDatabase); }
auto APPValidatorLogin(DAPPApplication myApp, string myName, DETBBase myDatabase) { return new DAPPValidatorLogin(myApp, myName, myDatabase); }
