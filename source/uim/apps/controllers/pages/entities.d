module uim.apps.controllers.pages.entities;

@safe:
import uim.apps;

class DAPPEntitiesPageController : DAPPPageController {
  mixin(ControllerThis!("APPEntitiesPageController"));

  protected DEntity[] _entities;
  DEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DEntity[] newEntities) {
    _entities = newEntities;
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
mixin(ControllerCalls!("APPEntitiesPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPEntitiesPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPEntitiesPageController); 
}}

