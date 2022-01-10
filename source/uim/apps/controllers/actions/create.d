module uim.apps.controllers.actions.create;

@safe:
import uim.apps;

class DAPPCreateActionController : DAPPActionController {
  mixin(APPControllerThis!("APPCreateActionController"));

  override void initialize() {
    super.initialize; 
    this.name = "APPCreateActionController";
    this.checks([APPCheckAppSessionExists, APPCheckDatabaseExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite]); 
  }

  mixin(OProperty!("string", "pool"));
  mixin(OProperty!("string", "pgPath"));
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCreateActionController~":DAPPCreateActionController::beforeResponse");
    super.beforeResponse(options);   
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    auto site = appSession.site;

    auto collection = database[site.name, pool];
    if (!collection) {
      options["redirect"] = pgPath~"/view"; 
      return; }

    auto entity = collection
      .createEntity
        .fromRequest(options)
        .save; 

    options["redirect"] = pgPath~"/view?id="~entity.id.toString; 
  }
}
mixin(APPControllerCalls!("APPCreateActionController"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPCreateActionController);
    assert(APPCreateActionController);
    assert(APPCreateActionController.name == "APPCreateActionController");
  }
}
