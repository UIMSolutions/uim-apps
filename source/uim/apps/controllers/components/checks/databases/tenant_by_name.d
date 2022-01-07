module uim.apps.controllers.components.checks.databases.tenant_by_name;

@safe:
import uim.apps;

class DAPPCheckDatabaseHasTenant : DAPPCheckDatabaseExists {
  mixin(AppControllerComponentThis!("APPCheckDatabaseHasTenant"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=tenant_missing");
  }

  mixin(OProperty!("string", "tenantName"));
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckDatabaseHasTenant~":DAPPCheckDatabaseHasTenant::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasTenant(tenantName)) {  
      this.error("collection_("~tenantName~")_missing");
      return false; }

    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckDatabaseHasTenant"));
