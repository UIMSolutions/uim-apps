module uim.apps.controllers.components.checks.databases.systems.sites;

@safe:
import uim.apps;

class DAPPCheckDatabaseHasSites : DAPPCheckDatabaseHasSystems {
  mixin(AppControllerComponentThis!("APPCheckDatabaseHasSites"));

  override void initialize() {
    super.initialize;

    this
    .redirectUrl("/error?message=collection_sites_missing");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAPPCheckDatabaseHasSites~":DAPPCheckDatabaseHasSites::check");
    if (!super.execute(options)) { return false; }

    if (!this.database.hasCollection("systems", "sites")) { // collection sites missing 
      this.error("collection_sites_missing");
      return false; }
    
    return true;
  }
}
mixin(AppControllerComponentCalls!("APPCheckDatabaseHasSites"));

version(test_uim_apps) {
  unittest {
    assert(new DAPPCheckDatabaseHasSItes);
    assert(APPCheckDatabaseHasSItes);
    assert(new DAPPCheckDatabaseHasSItes(APPController));
    assert(APPCheckDatabaseHasSItes(APPController));
  }
}