module uim.apps.controllers.pages.crud.read;
/**************************************************/
/* This package contains general view page definitions */
/**************************************************/

@safe:
import uim.apps;

class DAPPEntityReadController : DAPPEntityCrudPageController {
  mixin(APPPageControllerThis!("APPEntityReadController"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    
    this
    .view(APPEntityReadView)
    .scripts
      .addLinks(
        "/js/apps/entities/entity.js", 
        "/js/apps/entities/view.js", // deprecated
        "/js/apps/entities/read.js");
  }

  this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts.addLinks(
      "/js/apps/entities/"~entityName~"/entity.js", 
      "/js/apps/entities/"~entityName~"/view.js", // deprecated
      "/js/apps/entities/"~entityName~"/read.js");
  }

  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPEntityReadController~":DAPPEntityReadController::beforeResponse");
    super.beforeResponse(options);   
    if ("redirect" in options) {
      // debug writeln("Redirect to "~options["redirect"]);
      return;
    }

    auto appSession = getAppSession(options);

    if (!appSession) {
      options["redirect"] = "/";
      return; }

    if (!appSession.isValid(["session", "site"], options)) return; 

    auto selector = options.toEntitySelect;
    debug writeln(moduleName!DAPPEntityReadController~":DAPPEntityReadController::beforeResponse - Selecting entity with ", selector);
    this.entity(database[appSession.site, collectionName].findOne(options.toEntitySelect));
    if (!entity) {
      // TODO Errorhandling required
      return;
    }

    auto poolId = uniform(1, 1_000_000_000);
    entityPool[poolId] = entity;
    options["entityPool"] = to!string(poolId);
  
    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);
    }
  }
version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO
    }}
}
mixin(APPPageControllerCalls!("APPEntityReadController"));
