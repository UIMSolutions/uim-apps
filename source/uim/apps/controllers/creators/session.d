module uim.apps.controllers.creators.session;

@safe:
import uim.apps;

class DAPPCreatorSession : DAPPCreator {
  mixin(APPControllerThis!("APPCreatorSession"));

  override DOOPEntity create(STRINGAA parameters) {
    auto entity = createEntities["session"](Json.emptyObject)
      .id(randomUUID)
      .name(parameters.get("session", "session"~to!string(now)));
    if (database) database["systems", "system_sessions"].insertOne(entity);        

    return entity;
  }

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);

    if (auto session = create(parameters)) {
      result["results"]["session"] = session.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "Could not create session";
      result["errors"] ~= error;
    }
    return result; }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
  }
mixin(APPControllerCalls!("APPCreatorSession"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    /// TODO 
  }}

