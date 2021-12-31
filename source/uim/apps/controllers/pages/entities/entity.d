module uim.apps.controllers.pages.entities.entity;

@safe:
import uim.apps;

class DAPPEntityPageController : DAPPPageController, IAPPWithEntity {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }    

  mixin(OProperty!("DOOPEntity", "entity"));

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
auto APPEntityPageController() { return new DAPPEntityPageController; }
auto APPEntityPageController(DAPPApplication myApp) { return new DAPPEntityPageController(myApp); }