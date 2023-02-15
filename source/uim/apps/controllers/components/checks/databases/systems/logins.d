module uim.apps.controllers.components.checks.databases.systems.logins;

@safe:
import uim.apps;

class DControllerCheckDatabaseHasLogins : DControllerCheckDatabaseHasSystems {
  mixin(ControllerComponentThis!("APPCheckDatabaseHasLogins"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=collection_logins_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckDatabaseHasLogins~":DControllerCheckDatabaseHasLogins::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_logins")) { // collection logins missing 
      this.error("collection_logins_missing");
      return false; }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckDatabaseHasLogins"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DControllerCheckDatabaseHasLogins);
    assert(APPCheckDatabaseHasLogins);
    assert(new DControllerCheckDatabaseHasLogins(Controller));
    assert(APPCheckDatabaseHasLogins(Controller));
  }
}