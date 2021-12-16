module uim.apps.controllers.pages.create;
/**************************************************/
/* This package contains general create page definitions */
/**************************************************/

@safe:
import uim.apps;

class DAPPCreatePage : DAPPPage {
  this() { super(); 
    this
    .scripts(
      ["src":"/js/apps/entities/entity.js"], 
      ["src":"/js/apps/entities/create.js"])
    .checks([APPCheckAppSession, APPCheckSession, APPCheckSite]);
  }
  this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts(
      ["src":"/js/apps/entities/"~entityName~"/entity.js"], 
      ["src":"/js/apps/entities/"~entityName~"/create.js"]);
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

    auto entity = collection.toEntity(Json(null)); 
    if (pageHeader) (cast(DAPPPageHeader)pageHeader).entity(entity);
    if (form) form.entity(entity); 
    
    auto poolId = uniform(1, 1_000_000_000);
    entityPool[poolId] = entity;
    reqParameters["entityPool"] = to!string(poolId);
  }
}
