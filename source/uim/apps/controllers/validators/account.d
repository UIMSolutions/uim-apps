module uim.apps.controllers.validators.account;

@safe:
import uim.apps;

/* static this() {
  appErrorCodes[appErrorPrefix+100] = "Account id not valid or found";
} */

class DAPPValidatorAccount : DAPPValidator {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }
  this(DAPPApplication myApp, string myName) { this(myApp).name(myName); }
  this(DAPPApplication myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPApplication myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }

  override DOOPEntity validate(STRINGAA reqParameters) {
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
          auto dbAccount = database["central", "accounts"].findOne(UUID(accountIdParameter));
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
  unittest {
    version(test_uim_apps) {
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
  unittest {
    version(test_uim_apps) {
      /// TODO 
    }}
}
auto APPValidatorAccount() { return new DAPPValidatorAccount; }
auto APPValidatorAccount(DAPPApplication myApp) { return new DAPPValidatorAccount(myApp); }
auto APPValidatorAccount(DAPPApplication myApp, string myName) { return new DAPPValidatorAccount(myApp, myName); }
auto APPValidatorAccount(DAPPApplication myApp, DETBBase myDatabase) { return new DAPPValidatorAccount(myApp, myDatabase); }
auto APPValidatorAccount(DAPPApplication myApp, string myName, DETBBase myDatabase) { return new DAPPValidatorAccount(myApp, myName, myDatabase); }
