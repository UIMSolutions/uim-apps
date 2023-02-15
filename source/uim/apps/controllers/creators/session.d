module uim.apps.controllers.creators.session;

@safe:
import uim.apps;

class DAPPCreatorSession : DAPPCreator {
  mixin(ControllerThis!("APPCreatorSession"));

  override DEntity create(STRINGAA options) {
    auto entity = createEntities["session"](Json.emptyObject)
      .id(randomUUID)
      .name(options.get("session", "session"~to!string(now)));
    if (database) database["systems", "system_sessions"].insertOne(entity);        

    return entity;
  }

  override Json message(Json json, STRINGAA options) {    
    auto result = super.message(json, options);

    if (auto session = create(options)) {
      result["results"]["session"] = session.toJson;
    }
    else { // not validation error
      auto error = Json.emptyObject;
      error["id"] = "007";
      error["message"] = "Could not create session";
      result["errors"] ~= error;
    }
    return result; }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
  }
mixin(ControllerCalls!("APPCreatorSession"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    /// TODO 
  }}

