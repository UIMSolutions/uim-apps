module uim.apps.controllers.validators.account;

@safe:
import uim.apps;

/* static this() {
  appErrorCodes[appErrorPrefix+100] = "Account id not valid or found";
} */

class DAPPValidatorAccount : DAPPValidator {
  mixin(ControllerThis!("APPValidatorAccount"));

  override DEntity validate(STRINGAA reqParameters) {
    string appSessionId = reqParameters.get("appSessionId", "");
    auto appSession = getAppSession(reqParameters);

    // Looking for a accountId
    if (appSession) {
      auto account = appSession.account;
      if (!account) { // No account. Try to read from reqParameters
        auto accountIdParameter = "";
        if (!reqParameters.get("accountId", "").isUUID) // No valid loginId
          return null; // :-(

        accountIdParameter = reqParameters["accountId"];
        if (database) { // Look into database
          auto dbAccount = database["systems", "system_accounts"].findOne(UUID(accountIdParameter));
          if (dbAccount) {
            // found account :-)
            dbAccount.lastAccessedOn = toTimestamp(now);
            dbAccount.save; // Update

            appSession.account = dbAccount;
            return account;
          }        
        }
      }
    }
    
    return null; // Not valid ;
  }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}

  override Json message(Json json, STRINGAA parameters) {
    auto result = super.message(json, parameters);

    if (auto account = validate(parameters)) { // not validation error
      if ("results" !in result) result["results"] = Json.emptyObject; 
      result["results"]["account"] = account.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = 100;
      error["message"] = appErrorCodes[appErrorPrefix+100];
      result["errors"] ~= error;
    }
    return result;
  }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
}
mixin(ControllerCalls!("APPValidatorAccount"));

