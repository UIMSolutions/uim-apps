module uim.apps.controllers.actions.create;

@safe:
import uim.apps;

class DAPPActionCreate : DAPPActionController {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }

  override void initialize() {
    super.initialize; 
    this.name = "APPActionCreate";
    this.checks([APPCheckAppSession, APPCheckDatabase, APPCheckSession, APPCheckSite]); 
  }

  mixin(OProperty!("string", "pool"));
  mixin(OProperty!("string", "pgPath"));
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DAPPActionCreate~":DAPPActionCreate::beforeResponse");
    super.beforeResponse(options);   
    if ("redirect" in options) return;

    auto appSession = getAppSession(options);
    auto collection = database[appSession.site.name, pool];
    if (!collection) {
      options["redirect"] = pgPath~"/view"; 
      return; }

    auto entity = collection.toEntity(Json(null));
    entity.fromRequest(options);  
    collection.insertOne(entity); 

    options["redirect"] = pgPath~"/view?id="~entity.id.toString; 
  }
}
auto APPActionCreate() { return new DAPPActionCreate; }
auto APPActionCreate(DAPPApplication myApp) { return new DAPPActionCreate(myApp); }

unittest {
  version(uim_apps) {
    assert(new DAPPActionCreate);
    assert(APPActionCreate);
    assert(APPActionCreate.name == "APPActionCreate");
}}
