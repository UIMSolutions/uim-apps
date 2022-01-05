module uim.apps.controllers.actions.create;

@safe:
import uim.apps;

class DAPPCreateActionController : DAPPActionController {
  mixin(AppControllerThis!("APPCreateActionController"));

  override void initialize() {
    super.initialize; 
    this.name = "APPCreateActionController";
    this.checks([APPCheckAppSession, APPCheckDatabase, APPCheckSession, APPCheckSite]); 
  }

  mixin(OProperty!("string", "pool"));
  mixin(OProperty!("string", "pgPath"));
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCreateActionController~":DAPPCreateActionController::beforeResponse");
    super.beforeResponse(options);   
    if ("redirect" in options) return;

    auto appSession = getAppSession(options);
    auto collection = database[appSession.site.name, pool];
    if (!collection) {
      options["redirect"] = pgPath~"/view"; 
      return; }

    auto entity = collection.toEntity(Json(null));
    entity.fromRequest(options);  
    collection.insertOne(entity); 

    options["redirect"] = pgPath~"/view?id="~entity.id.toString; 
  }
}
mixin(AppControllerCalls!("APPCreateActionController"));

unittest {
  version(test_uim_apps) {
    assert(new DAPPCreateActionController);
    assert(APPCreateActionController);
    assert(APPCreateActionController.name == "APPCreateActionController");
}}
