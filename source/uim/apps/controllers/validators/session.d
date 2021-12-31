module uim.apps.controllers.validators.session;

@safe:
import uim.apps;

class DAPPValidatorSession : DAPPValidator {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }
  this(DAPPApplication myApp, string myName) { this(myApp).name(myName); }
  this(DAPPApplication myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPApplication myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }
  
  override DOOPEntity validate(STRINGAA reqParameters) {
    // Looking for a sessionId
    string appSessionId = reqParameters.get("appSessionId", "");
    auto appSession = getAppSession(reqParameters);

    auto session = appSession.session;
    if (!session) { // No session. Try to read from reqParameters
      auto sessionIdParameter = "";
      if (!reqParameters.get("sessionId", "").isUUID) // No valid loginId
        return null; // :-(

      sessionIdParameter = reqParameters["sessionId"];
      if (database) { // Look into database
        auto dbSession = database["central", "sessions"].findOne(UUID(sessionIdParameter));
        if (dbSession) {
          // found session :-)
          dbSession.lastAccessedOn = toTimestamp(now);
          dbSession.save; // Update

          appSession.session = dbSession;
          return dbSession;
        }        
      }
    }
    
    return null; // Not valid ;
  }

  override Json message(Json json, STRINGAA parameters) {
    auto result = super.message(json, parameters);

    if (auto session = validate(parameters)) { // not validation error
      if ("results" !in result) result["results"] = Json.emptyObject; 
      result["results"]["session"] = session.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "SessionId not found";
      result["errors"] ~= error;
    }
    return result;
  }
}
auto APPValidatorSession() { return new DAPPValidatorSession; }
auto APPValidatorSession(DAPPApplication myApp) { return new DAPPValidatorSession(myApp); }
auto APPValidatorSession(DAPPApplication myApp, string myName) { return new DAPPValidatorSession(myApp, myName); }
auto APPValidatorSession(DAPPApplication myApp, DETBBase myDatabase) { return new DAPPValidatorSession(myApp, myDatabase); }
auto APPValidatorSession(DAPPApplication myApp, string myName, DETBBase myDatabase) { return new DAPPValidatorSession(myApp, myName, myDatabase); }

