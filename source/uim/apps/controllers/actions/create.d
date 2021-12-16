module uim.apps.controllers.actions.create;

@safe:
import uim.apps;

class DAPPActionCreate : DAPPAction {
  this() { super(); 
    this
    .checks([APPCheckAppSession, APPCheckDatabase, APPCheckSession, APPCheckSite]); }
  this(DAPPUIM myApp) { this().app(myApp); }
  this(string myName) { this().name(myName); }
  this(DAPPUIM myApp, string myName) { this(myApp).name(myName); }
  this(DAPPUIM myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPUIM myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }


  mixin(OProperty!("string", "pool"));
  mixin(OProperty!("string", "pgPath"));
  
  override void beforeResponse(STRINGAA reqParameters) {
    debug writeln(moduleName!DAPPActionCreate~":DAPPActionCreate::beforeResponse");
    super.beforeResponse(reqParameters);   
    if ("redirect" in reqParameters) return;

    auto appSession = getAppSession(reqParameters);
    auto collection = database[appSession.site.name, pool];
    if (!collection) {
      reqParameters["redirect"] = pgPath~"/view"; 
      return; }

    auto entity = collection.toEntity(Json(null));
    entity.fromRequest(reqParameters);  
    collection.insertOne(entity); 

    reqParameters["redirect"] = pgPath~"/view?id="~entity.id.toString; }
}
auto APPActionCreate() { return new DAPPActionCreate; }

unittest {
  version(uim_apps) {
    /// TODO 
  }}
