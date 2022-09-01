module uim.apps.controllers.pages.crud.crud;

@safe:
import uim.apps;

class DAPPEntityCrudPageController : DAPPEntityPageController {
  mixin(APPPageControllerThis!("APPEntityCrudPageController"));

  override void beforeResponse(STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPEntityCrudPageController~":DAPPEntityCrudPageController::beforeResponse");
    super.beforeResponse(reqParameters);   
    if ("redirect" in reqParameters) return;
    
    auto appSession = getAppSession(reqParameters);

    auto collection = database[appSession.site, collectionName]; 
    if (!collection) {
      reqParameters["redirect"] = "/";
      return; }

    this.entity(collection.toEntity(Json(null)));
    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);
      
      auto poolId = uniform(1, 1_000_000_000);
      entityPool[poolId] = entity;
      reqParameters["entityPool"] = to!string(poolId);
    }
  }
}
mixin(APPPageControllerCalls!("APPEntityCrudPageController"));
