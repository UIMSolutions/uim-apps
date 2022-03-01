module uim.apps.controllers.pages.entities;

@safe:
import uim.apps;

class DAPPEntitiesPageController : DAPPPageController, IAPPWithEntities {
  mixin(APPControllerThis!("APPEntitiesPageController"));

  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { 
    return _entities; 
  }
  O entities(this O)(DOOPEntity[] newEntities) { 
    _entities = newEntities;

    if (auto entitiesView = cast(DAPPEntitiesView)this.view) {
      entitiesView.entities(this.entities);
    }
    
    return cast(O)this; 
  }
  mixin(OProperty!("string", "entityName"));
  mixin(OProperty!("string", "sortBy"));
  mixin(OProperty!("string", "sortOrder"));
  mixin(OProperty!("string", "pageNo"));
  mixin(OProperty!("string", "entries"));
  mixin(OProperty!("string", "filterBy"));
  mixin(OProperty!("string", "filterValue"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPPageController~":DAPPPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
    
    this.entityName = options.get("entityName", null);
    this.sortBy = options.get("sortBy", null);
    this.sortOrder = options.get("sortOrder", null);
    this.pageNo = options.get("pageNo", null);
    this.entries = options.get("entries", null);
    this.filterBy = options.get("filterBy", null);
    this.filterValue = options.get("filterValue", null);
  }
}
mixin(APPControllerCalls!("APPEntitiesPageController"));

version(test_uim_apps) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPEntitiesPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPEntitiesPageController); 
}}

