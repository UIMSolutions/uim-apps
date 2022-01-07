module uim.apps.controllers.pages.entities.create;
/**************************************************/
/* This package contains general create page definitions */
/**************************************************/

@safe:
import uim.apps;

class DAPPCreatePage : DAPPEntityPageController {
  this() { super(); 
    this
    // Checks to run for page request
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite])
    .scripts.addLinks(
      "/js/apps/entities/entity.js", 
      "/js/apps/entities/create.js");
    
  }
  this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts.addLinks(
      "/js/apps/entities/"~entityName~"/entity.js",
      "/js/apps/entities/"~entityName~"/create.js");
  }

  override void beforeResponse(STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPCreatePage~":DAPPCreatePage::beforeResponse");
    super.beforeResponse(reqParameters);   
    if ("redirect" in reqParameters) return;
    
    auto appSession = getAppSession(reqParameters);

    auto collection = database[appSession.site.name, collectionName]; 
    if (!collection) {
      reqParameters["redirect"] = "/";
      return; }

    this.entity(collection.toEntity(Json(null)));
    if (this.entity) { 
      if (auto entityHeader = cast(DAPPEntityPageHeader)pageHeader) entityHeader.entity(entity);
      if (auto entityForm = cast(DAPPEntityForm)form) entityForm.entity(entity); 
      
      auto poolId = uniform(1, 1_000_000_000);
      entityPool[poolId] = entity;
      reqParameters["entityPool"] = to!string(poolId);
    }
  }
}
