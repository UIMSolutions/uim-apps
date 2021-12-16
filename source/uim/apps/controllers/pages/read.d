module uim.apps.controllers.pages.read;
/**************************************************/
/* This package contains general view page definitions */
/**************************************************/

@safe:
import uim.apps;

class DAPPReadPage : DAPPPage {
  this() { super(); 
    this
    .scripts(
      ["src":"/js/apps/entities/entity.js"], 
      ["src":"/js/apps/entities/view.js"], // deprecated
      ["src":"/js/apps/entities/read.js"]);
  }
  this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts(
      ["src":"/js/apps/entities/"~entityName~"/entity.js"], 
      ["src":"/js/apps/entities/"~entityName~"/view.js"], // deprecated
      ["src":"/js/apps/entities/"~entityName~"/read.js"]);
  }

  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPReadPage~":DAPPReadPage::beforeResponse");
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
    debug writeln(moduleName!DAPPReadPage~":DAPPReadPage::beforeResponse - Selecting entity with ", selector);
    auto entity = database[appSession.site.name, collectionName].findOne(options.toEntitySelect);
    if (!entity) {
      // TODO Errorhandling required
      return;
    }

    auto poolId = uniform(1, 1_000_000_000);
    entityPool[poolId] = entity;
    options["entityPool"] = to!string(poolId);
  
    if (pageHeader) pageHeader.entity(entity);
    // if (panes) panes.entity(entity);
    if (form) form.entity(entity);
  }
  unittest {
    version(uim_cms) {
      /// TODO
    }}
}

