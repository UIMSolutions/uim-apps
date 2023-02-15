module uim.apps.controllers.actions.create;

@safe:
import uim.apps;

class DAPPCreateActionController : DAPPActionController {
  mixin(ControllerThis!("APPCreateActionController"));

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

    auto collection = database[site, pool];
    if (!collection) {
      options["redirect"] = pgPath~"/view"; 
      return; }

    auto entity = collection
      .createFromTemplate
      .fromRequest(options)
      .save; 

    options["redirect"] = pgPath~"/view?id="~entity.id.toString; 
  }
}
mixin(ControllerCalls!("APPCreateActionController"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DAPPCreateActionController);
  assert(APPCreateActionController);
  assert(APPCreateActionController.pool("testPool").pool == "testPool");
  assert(APPCreateActionController.pgPath("testPath").pgPath == "testPath");
    assert(APPCreateActionController.name == "APPCreateActionController");
  }
}
