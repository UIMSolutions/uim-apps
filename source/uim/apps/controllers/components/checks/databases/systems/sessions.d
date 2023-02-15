module uim.apps.controllers.components.checks.databases.systems.sessions;

@safe:
import uim.apps;

class DControllerCheckDatabaseHasSessions : DControllerCheckDatabaseHasSystems {
  mixin(ControllerComponentThis!("APPCheckDatabaseHasSessions"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=collection_sessions_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckDatabaseHasSessions~":DControllerCheckDatabaseHasSessions::execute");
    if (!super.execute(options)) { return false; }

    debug writeln(this.database ? "Database exists" : "Database missing");
    if (this.database) debug writeln(this.database.hasTenant("systems") ? "Tenant 'systems' exists" : "Tenant 'systems' missing");

    if (!this.database.hasTenant("systems")) {
      debug writeln("tenant systsms missing"); }

    if (!this.database["systems"].hasCollection("system_sessions")) { // collection sessions missing 
      this.error("collection_sessions_missing");
      return false; }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckDatabaseHasSessions"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DControllerCheckDatabaseHasSessions);
    assert(APPCheckDatabaseHasSessions);
    assert(new DControllerCheckDatabaseHasSessions(Controller));
    assert(APPCheckDatabaseHasSessions(Controller));
  }
}