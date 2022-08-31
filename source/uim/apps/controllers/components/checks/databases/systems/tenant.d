module uim.apps.controllers.components.checks.databases.systems.tenant;

@safe:
import uim.apps;

class DAPPCheckDatabaseHasSystems : DAPPCheckDatabaseExists {
  mixin(ControllerComponentThis!("APPCheckDatabaseHasSystems"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=tenant_systems_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckDatabaseHasSystems~":DAPPCheckDatabaseHasSystems::execute");
    if (!super.execute(options)) { return false; }

    debug writeln(this.database ? "Database exists" : "Database missing");

    if (!this.database.hasTenant("systems")) {  
      this.error("tenant_systems_missing");
      return false; }

    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckDatabaseHasSystems"));
