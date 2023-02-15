module uim.apps.controllers.components.checks.databases.systems.sites;

@safe:
import uim.apps;

class DControllerCheckDatabaseHasSites : DControllerCheckDatabaseHasSystems {
  mixin(ControllerComponentThis!("APPCheckDatabaseHasSites"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=collection_sites_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckDatabaseHasSites~":DControllerCheckDatabaseHasSites::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_sites")) { // collection sites missing 
      this.error("collection_sites_missing");
      return false; }
    
    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckDatabaseHasSites"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DControllerCheckDatabaseHasSites);
    assert(APPCheckDatabaseHasSites);
    assert(new DControllerCheckDatabaseHasSites(Controller));
    assert(APPCheckDatabaseHasSites(Controller));
  }
}