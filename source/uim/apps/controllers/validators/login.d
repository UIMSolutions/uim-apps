module uim.apps.controllers.validators.login;

@safe:
import uim.apps;

class DAPPValidatorLogin : DAPPValidator {
  mixin(ControllerThis!("APPValidatorLogin"));

  override DEntity validate(STRINGAA reqParameters) {
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
        auto dbLogin = database["systems", "system_logins"].findOne(UUID(loginIdParameter));
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
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

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
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
}
mixin(ControllerCalls!("APPValidatorLogin"));

