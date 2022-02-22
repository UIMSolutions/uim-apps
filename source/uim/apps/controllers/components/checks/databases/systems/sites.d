module uim.apps.controllers.components.checks.databases.systems.sites;

@safe:
import uim.apps;

class DAPPCheckDatabaseHasSites : DAPPCheckDatabaseHasSystems {
  mixin(APPControllerComponentThis!("APPCheckDatabaseHasSites"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=collection_sites_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckDatabaseHasSites~":DAPPCheckDatabaseHasSites::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "system_sites")) { // collection sites missing 
      this.error("collection_sites_missing");
      return false; }
    
    return true;
  }
}
mixin(APPControllerComponentCalls!("APPCheckDatabaseHasSites"));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

    assert(new DAPPCheckDatabaseHasSites);
    assert(APPCheckDatabaseHasSites);
    assert(new DAPPCheckDatabaseHasSites(APPController));
    assert(APPCheckDatabaseHasSites(APPController));
  }
}