module uim.apps.controllers.pages.crud.crud;

@safe:
import uim.apps;

class DAPPEntityCrudPageController : DAPPEntityPageController {
  mixin(APPPageControllerThis!("APPEntityCrudPageController"));

  mixin(OProperty!("string", "entityName"));

  override void beforeResponse(STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPEntityCrudPageController~":DAPPEntityCrudPageController::beforeResponse");
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
mixin(APPPageControllerCalls!("APPEntityCrudPageController"));
