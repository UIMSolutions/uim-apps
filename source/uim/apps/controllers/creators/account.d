module uim.apps.controllers.creators.account;

@safe:
import uim.apps;

/* static this() {
  appErrorCodes[appErrorPrefix+201] = "Could not create account";
}
 */
class DAPPCreatorAccount : DAPPCreator {
  mixin(ControllerThis!("APPCreatorAccount"));

  override DEntity create(STRINGAA parameters) {
    auto entity = createEntities["account"](Json.emptyObject)
      .id(randomUUID)
      .name(parameters.get("account", "account"~to!string(now)));
    entity["peer"] = parameters.get("peer", "");
    if (database) database["systems", "system_accounts"].insertOne(entity);        

    return entity;
  }

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);

    result["results"]["account"] = create(parameters).toJson;
    return result;
  }
}
mixin(ControllerCalls!("APPCreatorSite"));


version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    /// TODO 
  }}

