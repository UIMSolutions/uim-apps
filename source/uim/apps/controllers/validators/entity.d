module uim.apps.controllers.validators.entity;

@safe:
import uim.apps;

class DAPPValidatorEntity : DAPPValidator {
  mixin(ControllerThis!("APPValidatorEntity"));
 
  override DEntity validate(STRINGAA reqParameters) {
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
        auto dbEntity = database["systems", "entitys"].findOne(UUID(entityIdParameter));
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
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

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
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
}
mixin(ControllerCalls!("APPValidatorEntity"));
