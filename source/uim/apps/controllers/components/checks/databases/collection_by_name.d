module uim.apps.controllers.components.checks.databases.collection_by_name;

@safe:
import uim.apps;

class DAPPCheckDatabaseHasCollection : DAPPCheckDatabaseExists {
  mixin(AppControllerComponentThis!("APPCheckDatabaseHasCollection"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=collection_missing");
  }

  mixin(OProperty!("string", "tenantName"));
  mixin(OProperty!("string", "collectionName"));
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckDatabaseHasCollection~":DAPPCheckDatabaseHasCollection::check");
    if (!super.execute(options)) { return false; }
    
    if (!this.database.hasTenant(tenantName) || !this.database[tenantName].hasCollection(collectionName)) {  
      this.error("collection_("~tenantName~","~collectionName~")_missing");
      return false; }

    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckDatabaseHasCollection"));
