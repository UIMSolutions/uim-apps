module uim.apps.controllers.validators.entity;

@safe:
import uim.apps;

class DAPPValidatorEntity : DAPPValidator {
  this() { super(); }
  this(DAPPUIM myApp) { this().app(myApp); }
  this(DAPPUIM myApp, string myName) { this(myApp).name(myName); }
  this(DAPPUIM myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPUIM myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }
 
  override DOOPEntity validate(STRINGAA reqParameters) {
    string appSessionId = reqParameters.get("appSessionId", "");
    auto appSession = getAppSession(reqParameters);

    // Looking for a entityId
    auto entity = appSession.entity;
    if (!entity) { // No entity. Try to read from reqParameters
      auto entityIdParameter = "";
      if (!reqParameters.get("entityId", "").isUUID) // No valid loginId
        return null; // :-(

      entityIdParameter = reqParameters["entityId"];
      if (database) { // Look into database
        auto dbEntity = database["central", "entitys"].findOne(UUID(entityIdParameter));
        if (dbEntity) {
          // found entity :-)
          dbEntity.lastAccessedOn = toTimestamp(now);
          dbEntity.save; // Update

          if (appSession) appSession.entity = dbEntity;
          return dbEntity;
        }        
      }
    }
    
    return null; // Not valid ;
  }
  unittest {
    version(uim_apps) {
      /// TODO 
    }}

  override Json message(Json json, STRINGAA parameters) {
    auto result = super.message(json, parameters);

    auto entity = validate(parameters);
    if (entity) { // Error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "EntityId not found";
      json["results"]["errors"] ~= error;
    }
    else result["results"]["entity"] = entity.toJson;
   
    return result;
  }
  unittest {
    version(uim_apps) {
      /// TODO 
    }}
}
auto APPValidatorEntity() { return new DAPPValidatorEntity; }
auto APPValidatorEntity(DAPPUIM myApp) { return new DAPPValidatorEntity(myApp); }
auto APPValidatorEntity(DAPPUIM myApp, string myName) { return new DAPPValidatorEntity(myApp, myName); }
auto APPValidatorEntity(DAPPUIM myApp, DETBBase myDatabase) { return new DAPPValidatorEntity(myApp, myDatabase); }
auto APPValidatorEntity(DAPPUIM myApp, string myName, DETBBase myDatabase) { return new DAPPValidatorEntity(myApp, myName, myDatabase); }
